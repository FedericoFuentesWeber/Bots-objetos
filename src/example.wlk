//Parte 1
object benito
{
	var listaNegra = []
	
	method listaNegra() = listaNegra
	method listaNegra(palabra){listaNegra.add(palabra)}
	method tweetNegro(persona)
	{
		return persona.tweet().any({palabra => listaNegra.contains(palabra)})
	}
	method reportar(persona)
	{
		if(self.tweetNegro(persona))
		{
			policia.registrar(persona)
		}
	}
	
}

object policia
{
	var tweetAInvestigar = []
	var detenidos = []
	
	method tweetAInvestigar() = tweetAInvestigar
	method detenidos() = detenidos
	method registrar(persona){
		tweetAInvestigar.add(persona.tweet())
		detenidos.add(persona.nombreUsuario())
	}
}
object persona
{
	var nombreUsuario
	var tweet = []
	
	method nombreUsuario() = nombreUsuario
	method nombreUsuario(nombre){nombreUsuario = nombre}
	method tweet() = tweet
	method tweet(algo){tweet.add(algo)}
	method twittear()
	{
		if(self.tweet()>15)
		{
			error.throwWithMessage("algo")
		}
		else
		{
			tweet.recibirTweet(self.tweet())
		}
	}
}

object tweet
{
	method recibirTweet()
	{
		
	}
}

class BotPublicidad
{
	
}

class BotJuntaDatos
{
	
}