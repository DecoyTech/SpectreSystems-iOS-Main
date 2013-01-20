#!/usr/bin/env ruby
require 'rhoconnect/application/init'

# secret is generated along with the app
Rhoconnect::Server.set     :secret,      '36b4eb31e183a62b12d810643afc420a8547ccd427e8ee84ef52f550aac742061833105fc7dc69567d9bcf52d11e944dac14d52989335a427aa618e64ed74be3'

# !!! Add your custom initializers and overrides here !!!
# For example, uncomment the following line to enable Stats
#Rhoconnect::Server.enable  :stats
# uncomment the following line to disable Resque Front-end console
#Rhoconnect.disable_resque_console = true
# uncomment the following line to disable Rhoconnect Front-end console
#Rhoconnect.disable_rc_console = true

# Load RhoConnect application
require './application'

# run RhoConnect Application
run Rhoconnect.app