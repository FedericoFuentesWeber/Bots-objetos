//Parte 1
/*object benito
{
	var listaNegra = []
	
	method listaNegra() = listaNegra
	method listaNegra(palabra){listaNegra.add(palabra)}
	method tweetNegro(tweet)
	{
		return tweet.texto().any({palabra => listaNegra.contains(palabra)})
	}
	method reportar(tweet)
	{
		if(self.tweetNegro(tweet))
		{
			policia.registrar(tweet)
		}
	}
	method responder(tweet)
	{
		self.reportar(tweet)
	}
	
}
*/
/*object policia
{
	var tweetAInvestigar = []
	var detenidos = []
	
	method tweetAInvestigar() = tweetAInvestigar
	method detenidos() = detenidos
	method registrar(tweet){
		tweetAInvestigar.add(tweet.texto())
		detenidos.add(tweet.usuario())
	}
}
*/

object benito //bot boton
{
	var listaNegra = []
	method listaNegra() = listaNegra
	method listaNegra(palabra) {listaNegra.add(palabra)}

	method tweetNegro(tweet)
	{
		return tweet.texto().any({palabra => listaNegra.contains(palabra)})
	}
	
	/*method reportar(tweet)
	{
		if(self.tweetNegro(tweet))
		{
			policia.reporte(tweet)
		}
	}*/
	
	method responder(tweet)
	{
		if(self.tweetNegro(tweet))
		{
			policia.reporte(tweet)
		}
	}
}

class BotNoFail // bot de publicidad
{
	var mensaje
	var link
	var listaPublicitaria = []
	constructor(msj,pub)
	{
		mensaje = msj
		link = pub
	}
	method listaPublicitaria() = listaPublicitaria
	method listaPublicitaria(palabra) {listaPublicitaria.add(palabra)}
	method tweetPublicitario(tweet)
	{
		return tweet.texto().any({palabra => listaPublicitaria.contains(palabra)})
	}
	
	method arrobar(tweet){}
	method responder(tweet)
	{
		if(self.tweetPublicitario(tweet))
		{
			var nombre = tweet.usuario()
      		tweet.usuario("@"+nombre)
      		tweet.usuario().recibirPublicidad(mensaje,link)
		}
	}
}

object policia 
{
	var usuariosReg = []
	var tweetReg = []
	
	method agregarUsuario(usuario) {usuariosReg.add(usuario)}
	method agregarTweet(tweet) {tweetReg.add(tweet)}
	
	method usuariosReg() = usuariosReg
	method tweetReg() = tweetReg
	
	method reporte(tweet)
	{
		self.agregarUsuario(tweet.usuario())
		self.agregarTweet(tweet.texto())
	}
}

class Persona 
{
	var tweet = []
 	constructor(twt)
	{
		tweet.add(twt)
	}

	method tweet () = tweet
	method tweet(texto) {tweet.add(texto)}
	
	method twittear()
	{
		if(self.tweet().texto().size() > 15)
		{
			error.throwWithMessage("macho, escribí un tweet más corto")
		}
		else
		{
			twitter.recibirTweet(self.tweet())
		}
	}
	method recibirPublicidad(mensaje,link){}

}

class Tweet 
{
	var texto = []
	var usuario
	
	constructor(user, txt)
	{
		texto = txt
		usuario = user
	}
	
	method texto() = texto
	method usuario() = usuario
	
	method texto(txt) {texto = txt}
	method usuario(user) {usuario = user}
	
}

object twitter
{
	var bots = [benito]
	method bots() = bots
	method AgregarBot(bot) {bots.add(bot)}
	
	method recibirTweet(tweet)
	{
		bots.forEach({bot => bot.responder(tweet)})
	}
}