# Photon
## Studente
Nicholas Kania
#326850

## Scopo dell'applicazione
Lo scopo dell'applicazione consiste nel creare un applicativo software che faciliti il backup su un server locale delle foto del dispositivo.

## Casi d'Uso
Il caso d'uso inerente all'applicazione risulta alquanto semplice, ossia la necessità di salvare le foto presenti all'interno del dispositivo su un server locale in maniera facile, rapida e sicura.

### Flusso di Utilizzo
L'utente scannerizza il codice QR mostrato dal server. Dopodiché verrà effettuato un tentativo di autenticazione: se il QR è valido e sia il client che il server si trovano all'interno della stessa rete, il dispositivo verrà autenticato.

Una volta effettuata l'autenticazione, comparirà all'interno della AppBar una voce per il logout ed all'utente verrà mostrata una pagina contenente un pulsante per tornare all'interno della Home.

Se autenticati, essa mostrerà le due funzionalità dell'applicazione: caricamento file e cronologia presso quel server.

Nel primo caso, verranno lette le varie immagini dal dispositivo (directory: '/storage/emulated/0') e successivamente mostrate a schermo (nome file e percorso). In fondo apparirà una pulsante che permette di caricare le immagini (se non vi è un caricamento in corso o se esse sono state tutte caricate), interrompere un caricamento 

## Esperienza Utente


## Tecnologia
### Dipendenze
- flutter_riverpod: ^2.4.8
- shared_preferences: ^2.2.2
- permission_handler: ^11.0.1
- uuid: ^4.2.1
- qr_code_scanner: ^1.0.1
- http: 1.1.0

### Scelte Implementative