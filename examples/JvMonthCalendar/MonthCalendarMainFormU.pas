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

unit MonthCalendarMainFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, JvCalendar, JvComponent;

type
  TMonthCalendarMainForm = class(TForm)
    StatusBar1: TStatusBar;
    chkMulti: TCheckBox;
    chkShow: TCheckBox;
    chkCircle: TCheckBox;
    chkWeeks: TCheckBox;
    mc: TJvMonthCalendar2;
    procedure mcSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
    procedure mcSelect(Sender: TObject; StartDate, EndDate: TDateTime);
    procedure chkMultiClick(Sender: TObject);
    procedure chkShowClick(Sender: TObject);
    procedure chkCircleClick(Sender: TObject);
    procedure chkWeeksClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  MonthCalendarMainForm: TMonthCalendarMainForm;

implementation

{$R *.DFM}

procedure TMonthCalendarMainForm.mcSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
begin
  StatusBar1.Panels[0].Text := Format('Visible dates are from %s to %s (incl. partial months)',[DateToStr(Mc.FirstVisibleDate(true)),DateToStr(Mc.LastVisibleDate(true))]);
end;

procedure TMonthCalendarMainForm.mcSelect(Sender: TObject; StartDate, EndDate: TDateTime);
var
  Y,M,D : Word;
begin
  Caption := Format('User selected from %s to %s',[DateToStr(StartDate),DateToStr(EndDate)]);
  DecodeDate(StartDate,Y,M,D);
  { toggle bold on / off }
  mc.Bold[Y,M,D] := not mc.Bold[Y,M,D];
end;

procedure TMonthCalendarMainForm.chkMultiClick(Sender: TObject);
begin
  mc.MultiSelect := chkMulti.Checked;
end;

procedure TMonthCalendarMainForm.chkShowClick(Sender: TObject);
begin
  mc.ShowToday := chkShow.Checked;
end;

procedure TMonthCalendarMainForm.chkCircleClick(Sender: TObject);
begin
  mc.CircleToday := chkCircle.Checked;
end;

procedure TMonthCalendarMainForm.chkWeeksClick(Sender: TObject);
begin
  mc.WeekNumbers := chkWeeks.Checked;
end;

procedure TMonthCalendarMainForm.FormShow(Sender: TObject);
var Y,M,D:word;
begin
  mc.Today := Date;
  DecodeDate(Date,y,m,d);
  mc.BoldDays.Add(Format('0000%.2d=2,4,7,11',[M]));
  mc.BoldDays.Add(Format('%.4d%.2d=1,3,5,9',[Y,M]));
  Caption :=  Format('ComCtl32.dll version: %d.%d',[HiWord(GetComCtlVersion),LoWord(GetComCtlVersion)]);
end;

end.
