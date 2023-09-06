/datum/emote/audio
	key = "fbi"
	key_third_person = "fbis"
	message = "yells, \"<b>FBI OPEN UP!</b>\""
	var/emote_sound = 'sound/hispania/voice/emotes/fbi.ogg'
	emote_type = EMOTE_AUDIBLE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)
	var/emote_cooldown = 2
	cooldown = 0

/datum/emote/audio/run_emote(mob/user, params,  type_override, intentional)
	. = ..()
	if(.)
		if(cooldown < world.time - emote_cooldown)
			cooldown = world.time
			if(isobserver(user) && prob(90)) //Taunting in their grave
				user.playsound_local(get_turf(user), emote_sound, 50, FALSE)
				return
			playsound(user, emote_sound, 50, FALSE)

/datum/emote/audio/illuminati
	key = "illuminati"
	key_third_person = "illuminates"
	message = "exudes a mysterious aura!"
	emote_sound = 'sound/hispania/voice/emotes/illuminati.ogg'
	emote_cooldown = 7

/datum/emote/audio/bonerif
	key = "bonerif"
	key_third_person = "bonerifs"
	message = "riffs!"
	emote_sound = 'sound/hispania/voice/emotes/bonerif.ogg'
	emote_cooldown = 2

/datum/emote/audio/fusrodah
	key = "fusrodah"
	key_third_person = "fusrodahs"
	message = "yells, \"<b>FUS RO DAH!!!</b>\""
	emote_sound = 'sound/hispania/voice/emotes/fusrodah.ogg'
	emote_cooldown = 7

/datum/emote/audio/spoonful
	key = "spoonful"
	key_third_person = "spoonfuls"
	message = "asks for a spoonful."
	emote_sound = 'sound/hispania/voice/emotes/spoonful.ogg'
	emote_cooldown = 3

/datum/emote/audio/deathglare
	key = "glare2"
	key_third_person = "glares2"
	message = "<b><i>glares</b></i>."
	emote_sound = 'sound/hispania/voice/emotes/deathglare.ogg'
	emote_cooldown = 4.4

/datum/emote/audio/cry2
	key = "cry2"
	key_third_person = "cries2"
	message = "cries like a king."
	emote_sound = 'sound/hispania/voice/emotes/cry_king.ogg'
	emote_cooldown = 1.6

/datum/emote/audio/huh
	key = "huh"
	key_third_person = "huh's"
	message = "seems confused."
	emote_sound = 'sound/hispania/voice/emotes/huh.ogg'
	emote_cooldown = 1

/datum/emote/audio/laugh2
	key = "laugh2"
	key_third_person = "laughs2"
	message = "laughs in Scottish."
	emote_sound = 'sound/hispania/voice/emotes/laugh_deman.ogg'
	emote_cooldown = 2.75

/datum/emote/audio/lawyerup
	key = "lawyerup"
	key_third_person = "lawyerups"
	message = "emits an aura of expertise."
	emote_sound = 'sound/hispania/voice/emotes/lawyerup.ogg'
	emote_cooldown = 7.5

/datum/emote/audio/ohhmygod
	key = "mygod"
	key_third_person = "omgs"
	message = "invokes the presence of Jesus Christ."
	emote_sound = 'sound/hispania/voice/emotes/OMG.ogg'
	emote_cooldown = 1.6

/datum/emote/audio/rizz
	key = "rizz"
	key_third_person = "rizzes"
	message = "saw something <u>hot</u>."
	emote_sound = 'sound/hispania/voice/emotes/rizz.ogg'
	emote_cooldown = 1.43

/datum/emote/audio/eyebrow2
	key = "eyebrow2"
	key_third_person = "eyebrows2"
	message = "<b>raises an eyebrow.</b>"
	message_mime = "<b>raises an eyebrow with quaking force!</b>"
	emote_sound = 'sound/hispania/voice/emotes/vineboom.ogg'
	emote_cooldown = 2.9

/datum/emote/audio/choir
	key = "choir"
	key_third_person = "choirs"
	message = "let out a choir!"
	emote_sound = 'sound/hispania/voice/emotes/choir.ogg'
	emote_cooldown = 6

/datum/emote/audio/bruh
	key = "bruh"
	key_third_person = "bruhs"
	message = "thinks this is a bruh moment."
	emote_sound = 'sound/hispania/voice/emotes/bruh.ogg'
	emote_cooldown = 0.6

/datum/emote/audio/halt
	key = "halt"
	key_third_person = "halts"
	message = "yells, \"<b>HEY! HEEY! HALT!!</b>\""
	emote_sound = 'sound/hispania/voice/emotes/halt.ogg'
	emote_cooldown = 2

/datum/emote/audio/medic
	key = "medic"
	key_third_person = "medics"
	message = "yells, \"<b>MEEEEEEDIIIIIC!!</b>\""
	emote_sound = 'sound/hispania/voice/emotes/medic.ogg'
	emote_cooldown = 2.5

/datum/emote/audio/burenyuu
	key = "burenyuu"
	key_third_person = "burenyuus"
	message = "makes a cat sound"
	emote_sound = 'sound/hispania/voice/emotes/burenyuu.ogg'
	emote_cooldown = 2.5

/datum/emote/audio/augh
	key = "augh"
	key_third_person = "aughs"
	message = "makes a fish suffocation sound"
	emote_sound = 'sound/hispania/voice/emotes/augh.ogg'
	emote_cooldown = 1

/datum/emote/audio/fart
	key = "fart"
	key_third_person = "farts"
	message = "breaks wind!"
	emote_sound = 'sound/hispania/voice/emotes/fart1.ogg'
	emote_cooldown = 1.6
