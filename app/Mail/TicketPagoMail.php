<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf; // Importa el facade de DomPDF
use App\Models\Pedido; // Importa el modelo Pedido

class TicketPagoMail extends Mailable
{
    use Queueable, SerializesModels;

    public $pedido;
    public $pdfAttachment; // Propiedad para almacenar el PDF binario

    /**
     * Create a new message instance.
     *
     * @param Pedido $pedido
     * @return void
     */
    public function __construct(Pedido $pedido)
    {
        $this->pedido = $pedido;
        // Generar el PDF al construir el Mailable
        $this->generatePdfAttachment();
    }

    /**
     * Get the message envelope.
     *
     * @return \Illuminate\Mail\Mailables\Envelope
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Tu Ticket de Pago de Tasca Don Quino ',
        );
    }

    /**
     * Get the message content definition.
     *
     * @return \Illuminate\Mail\Mailables\Content
     */
    public function content(): Content
    {
        // Puedes tener una vista HTML simple para el cuerpo del correo.
        // Opcional: Podrías simplemente usar texto plano si el PDF es el contenido principal.
        return new Content(
            view: 'emails.ticket_confirmacion', // Crea esta vista si quieres un cuerpo de correo
            // htmlString: '<p>Adjunto encontrarás tu ticket de pago. ¡Gracias por tu compra!</p>'
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [
            \Illuminate\Mail\Mailables\Attachment::fromData(fn () => $this->pdfAttachment, 'ticket_pedido_' . $this->pedido->id . '.pdf')
                ->withMime('application/pdf'),
        ];
    }

    /**
     * Genera el PDF y lo almacena para adjuntarlo.
     *
     * @return void
     */
    protected function generatePdfAttachment()
    {
        // Asegúrate de cargar las relaciones necesarias para la vista del PDF
        $this->pedido->loadMissing('user', 'mesa', 'productos');

        // Renderiza la vista Blade a PDF
        $pdf = Pdf::loadView('emails.tickets.pago', ['pedido' => $this->pedido]);

        // Guarda el contenido binario del PDF
        $this->pdfAttachment = $pdf->output();
    }
}