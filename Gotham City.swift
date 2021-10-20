import UIKit

protocol datiAnagrafici{
    var nome:String{get set}
    var cognome:String{get set}
    
}
protocol Fascicoli{
    var idCriminale:Int{get set}
    var dataCarcerazione:String{get set}
    var dataScarcerazione:String{get set}
    var crimineCommesso:String{get set}
    var evento:String{get set} //evaso o deceduto
    
}

struct Guardie:datiAnagrafici{
    var nome: String
    var cognome: String
    
    var visualizza:String{
        return "Nome:\(nome), Cognome:\(cognome)"
    }
    
}
struct Detenuti:datiAnagrafici,Fascicoli{
    var idCriminale: Int
    var dataCarcerazione: String
    var dataScarcerazione: String
    var crimineCommesso: String
    var evento: String
    var nome: String
    var cognome: String
    
    init(){
        idCriminale = 0
        dataCarcerazione = ""
        dataScarcerazione = ""
        crimineCommesso = ""
        evento = ""
        nome = ""
        cognome = ""
    }
    
    //inizializzo con parametri
    init(idCriminale:Int,dataCarcerazione:String,dataScarcerazione:String,crimineCommesso:String,evento:String,nome:String,cognome:String){
        self.idCriminale = idCriminale
        self.dataCarcerazione = dataCarcerazione
        self.dataScarcerazione = dataScarcerazione
        self.crimineCommesso = crimineCommesso
        self.evento = evento
        self.nome = nome
        self.cognome = cognome
    }
    
    var visualizza:String{
        return "Nome:\(nome), Cognome:\(cognome)"
    }
}

struct BancaDati{
    var listaGuardie:[Guardie] = [Guardie]()
    var listaDetenuti:[Detenuti] = [Detenuti]()
    
    var listaFascicoli:[Fascicoli] = [Fascicoli]()
    
    //assumere nuova gente (aggiungo nel mio array di listaGuardie
    mutating func assunzione(guardie:Guardie){
        listaGuardie.append(guardie)
        //listaFascicoli.append(guardie)
    }
    // schedare nuovi carcerati, aggiungo nuovi carcerati nella listaDetenuti
    mutating func schedareNuoviCarcerati(detenuto:Detenuti){
        listaDetenuti.append(detenuto)
        listaFascicoli.append(detenuto)
    }
    /*
    //aggiungo nuovi fascicoli nella listaFascicoli
    func aggiungereNuoviFascicoli(){
        
    }*/
    
    //Visualizzare l'elenco per ciscuna categoria(guardie, criminali, fascicoli)
    func visualizzaInfoDetenuti(){
        for info in listaDetenuti{
        
            print( "idCriminale: \(info.idCriminale), dataCarcerazione: \(info.dataCarcerazione), dataScarcerazione: \(info.dataScarcerazione), crimineCommesso: \(info.crimineCommesso), evento: \(info.evento)")
        }
    }
    //Visualizzo le informazioni nome e cognome delle guardie
    func visualizzaInfoGuardia(){
        for info in listaGuardie{
            print("Guardia")
            print("Nome: \(info.nome), Cognome: \(info.cognome)")
        }
    }
    //Ricerca del fascicolo passandoli il nome in ingresso
    func ricercaFascicolo(nome:String){
        for info in listaDetenuti{
        
            if nome == info.nome{
                print("Fascicolo trovato!")
                print( "idCriminale: \(info.idCriminale), dataCarcerazione: \(info.dataCarcerazione), dataScarcerazione: \(info.dataScarcerazione), crimineCommesso: \(info.crimineCommesso), evento: \(info.evento)")
            }else{
                print("Nome non trovato")
            }
        }
    }
    // Numero totale delle guardie
    func nrGuardie(){
        var nrTotale = 0
        for nr in listaGuardie{
            nrTotale += 1
        }
        print("Numero delle guardie: ",nrTotale)
    }
    
    //Numero dei detenuti totali
    func nrDetenuti(){
        var nrTotale = 0
        for nr in listaDetenuti{
            nrTotale += 1
        }
        print("Numero dei detenuti: ",nrTotale)
    }
    //Numero dei detenuti evasi
    func nrDetenuriEvasi(){
        var nrTotale = 0
        for nr in listaDetenuti{
            if nr.evento == "evaso"{
                nrTotale += 1
            }
        }
        print("Numero dei evasi: ",nrTotale)
    }
    //Numero dei detenuti deceduti
    func nrDetenuriMorti(){
        var nrTotale = 0
        for nr in listaDetenuti{
            if nr.evento == "deceduto"{
                nrTotale += 1
            }
        }
        print("Numero detenuti deceduti: ",nrTotale)
    }
}

/* MAIN */
var dati = BancaDati()
var d1 = Detenuti(idCriminale: 1122, dataCarcerazione: "12/11/2000", dataScarcerazione: "12/11/2050", crimineCommesso: "omicidio", evento: "nil", nome: "Pippo", cognome: "Pluto")
var d2 = Detenuti(idCriminale: 3344, dataCarcerazione: "12/11/2020", dataScarcerazione: "12/11/2022", crimineCommesso: "furto", evento: "evaso", nome: "pp", cognome: "vv")
var d3 = Detenuti(idCriminale: 5577, dataCarcerazione: "12/11/2020", dataScarcerazione: "12/11/2022", crimineCommesso: "furto", evento: "deceduto", nome: "Palino", cognome: "vv")
var g1 = Guardie(nome: "Mario", cognome: "Rossi")

dati.schedareNuoviCarcerati(detenuto: d1)
dati.schedareNuoviCarcerati(detenuto: d2)
dati.schedareNuoviCarcerati(detenuto: d3)
dati.assunzione(guardie: g1)
dati.visualizzaInfoDetenuti()
dati.visualizzaInfoGuardia()
dati.ricercaFascicolo(nome: "Anna")
dati.ricercaFascicolo(nome: "Pippo")
dati.nrGuardie()
dati.nrDetenuti()
dati.nrDetenuriEvasi()
dati.nrDetenuriMorti()
