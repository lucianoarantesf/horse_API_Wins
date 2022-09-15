object ServerService: TServerService
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'API - Win Service'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
