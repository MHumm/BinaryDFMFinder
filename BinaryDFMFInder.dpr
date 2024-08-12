/// <summary>
///   Lists all DFM files under a certain folder (including subfolders) which
///   are still in binary format. Written in Delphi 12.1 or newer.
///
///   (c) 2024 Markus Humm
///   Under Apache 2.0 license
/// </summary>
program BinaryDFMFinder;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  Winapi.Windows;

function IsBinaryDFM(const FileName: string): Boolean;
var
  F: TFileStream;
  B: Byte;
begin
  B := 0;
  F := TFileStream.Create(FileName, fmOpenRead);
  try
    F.Read( B, 1 );
    Result := B = $FF;
  finally
    F.Free;
  end;
end;

procedure FindDFMs(const Dir: string);
var
  Dirs  : TArray<string>;
  Files : TArray<string>;
begin
  Files := TDirectory.GetFiles(Dir, '*.dfm');

  for var FileName in Files do
    if IsBinaryDFM(TPath.Combine(Dir, FileName)) then
      WriteLn(TPath.Combine(Dir, FileName));

  Dirs := TDirectory.GetDirectories(Dir);

  for var DirPath in Dirs do
    FindDFMs(Dirpath);
end;

begin
  try
    if ParamCount > 0 then
      FindDFMs(ParamStr(1))
    else
      FindDFMs(TDirectory.GetCurrentDirectory);

//    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
