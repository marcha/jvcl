{******************************************************************

                       JEDI-VCL Demo

 Copyright (C) 2002 Project JEDI

 Original author:

 Contributor(s):

 You may retrieve the latest version of this file at the JEDI-JVCL
 home page, located at http://jvcl.sourceforge.net

 The contents of this file are used with permission, subject to
 the Mozilla Public License Version 1.1 (the "License"); you may
 not use this file except in compliance with the License. You may
 obtain a copy of the License at
 http://www.mozilla.org/MPL/MPL-1_1Final.html

 Software distributed under the License is distributed on an
 "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 implied. See the License for the specific language governing
 rights and limitations under the License.

******************************************************************}

unit fJvHLEdPropDlgTestParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, JvComponent;

type
  TMyParams  = class(TForm)
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
  published
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Load;
    procedure Save;
    function GetAppCaption: String;
  end;

implementation

{$R *.DFM}

procedure TMyParams .Load;
begin
end;

procedure TMyParams .Save;
begin
end;

function TMyParams .GetAppCaption: String;
begin
  Result := Edit1.Text;
end;

end.
