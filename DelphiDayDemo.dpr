program DelphiDayDemo;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  WiRL.Engine.Core,
  WiRL.http.Server,
  WiRL.http.Server.Indy;

var
  LServer: TWiRLServer;
begin
  try
    Writeln('Avvio del server WiRL per il DelphiDay...');

    LServer := TWiRLServer.Create(nil);
    try
      LServer.Port := 8080;

      LServer.AddEngine<TWiRLCustomEngine>('/rest');

      LServer.Active := True;
      Writeln('Server in ascolto su http://localhost:8080/rest');
      Writeln('Premi INVIO per fermare il server.');
      Readln;

    finally
      LServer.Free;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
