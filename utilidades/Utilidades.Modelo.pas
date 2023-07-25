unit Utilidades.Modelo;

interface
uses  Winapi.Windows, Winapi.Messages,System.SysUtils, System.Variants, System.Classes,
      DateUtils, Vcl.Grids, Vcl.DBGrids;

type
   TUtilidades = class
   private
    //
   public
     constructor Create;
     destructor Destroy; override;

     function GetVersaoArq: string;
     function HoraAtual: string;
     function DataAtual: string;
     function FormataCEP(vCEP_Antigo : string): string;
     function GerarNumerosCod : integer;
   end;

implementation

{ TUtilidades }

constructor TUtilidades.Create;
begin
//
end;

function TUtilidades.DataAtual: string;
begin
  result := FormatDateTime('dddd dd "de" mmmm "de" yyyy',Now);
end;

destructor TUtilidades.Destroy;
begin
  inherited;
end;

function TUtilidades.FormataCEP(vCEP_Antigo: string): string;
var
  CEP_Formatado: string;
begin
  CEP_Formatado := vCEP_Antigo;
  CEP_Formatado := StringReplace(CEP_Formatado, '.', '', [rfReplaceAll]);
  CEP_Formatado := StringReplace(CEP_Formatado, '-', '', [rfReplaceAll]);
  Result := CEP_Formatado;
end;

function TUtilidades.GerarNumerosCod: integer;
const
 C=10;
var
  I, A, P : Integer;
  Num: array[0..C - 1] of Integer;
begin
  randomize;
  for I := 0 to C - 1 do
    Num[I] := I+1;
  for I := C - 1 downto 0 do
  begin
    P := Random(I+1);
    A := Num[I];
    Num[I] := Num[P];
    Num[P] := A;
  end;
  for I := Low(Num) to High(Num) do
    Result := Num[I];
end;

function TUtilidades.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function TUtilidades.HoraAtual: string;
begin
  result := TimeToStr(Now);
end;

end.
