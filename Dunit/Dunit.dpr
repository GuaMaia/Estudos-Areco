program Dunit;

uses
  Vcl.Forms,
  UCalculadora in 'UCalculadora.pas' {FCalculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCalculadora, FCalculadora);
  Application.Run;
end.
