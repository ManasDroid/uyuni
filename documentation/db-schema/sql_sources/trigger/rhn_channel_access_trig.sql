-- created by Oraschemadoc Tue Jul 19 17:31:32 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_CHANNEL_ACCESS_TRIG" 
after update on rhnChannel
for each row
begin
   if :old.channel_access = 'protected' and
      :new.channel_access != 'protected'
   then
      delete from rhnChannelTrust where channel_id = :old.id;
   end if;
end;
ALTER TRIGGER "SPACEWALK"."RHN_CHANNEL_ACCESS_TRIG" ENABLE
 
/
