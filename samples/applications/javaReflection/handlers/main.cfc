<!-----------------------------------------------------------------------Author 	 :	Your NameDate     :	September 25, 2005Description :	This is a ColdBox event handler where all implicit methods can go.	Thus its the main handler.Please note that the extends needs to point to the eventhandler.cfcin the ColdBox system directory.extends = coldbox.system.eventhandler-----------------------------------------------------------------------><cfcomponent name="main" extends="coldbox.system.eventhandler" output="false">	<!--- This init format is mandatory if you are writing init code else is optional,	      include the super.init(arguments.controller).	<cffunction name="init" access="public" returntype="any" output="false">		<cfargument name="controller" type="any">		<cfset super.init(arguments.controller)>		<!--- Any constructor code here --->		<cfreturn this>	</cffunction>	--->	<cffunction name="onAppInit" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfscript>			/* Init Reflector */			var appPath = getSetting('AppMapping');			var reflectionPath = "model.reflection.reflector";						/* Prefix. */			if( appPath.length() gt 0 ){				reflectionPath = "#appPath#.#reflectionPath#";			}						/* Create Reflection */			oReflector = CreateObject("Component",reflectionPath);						/* Cache it */			getColdboxOCM().set("reflector",oReflector,0);					</cfscript>	</cffunction>	<cffunction name="onRequestStart" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfscript>			var rc = event.getCollection();						/* Place reflector on RC */			rc.oReflector = getColdBoxOCM().get("reflector");					</cfscript>	</cffunction>	<cffunction name="onRequestEnd" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- ON Request End Here --->	</cffunction>		<cffunction name="onSessionStart" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- ON session start Here --->	</cffunction>		<cffunction name="onSessionEnd" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- ON session End Here --->		<cfset var sessionScope = event.getValue("sessionReference")>			</cffunction>	<cffunction name="onException" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<!--- ON Exception Handler Here --->		<cfscript>			//Grab Exception From request collection, placed by ColdBox			var exceptionBean = event.getValue("ExceptionBean");			//Place exception handler below:		</cfscript>	</cffunction></cfcomponent>