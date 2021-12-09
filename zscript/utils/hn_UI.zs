/* Copyright Alexander Kromm (mmaulwurff@gmail.com) 2018-2021
 *
 * This file is part of Hellscape Navigator.
 *
 * Hellscape Navigator is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Hellscape Navigator is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Hellscape Navigator.  If not, see <https://www.gnu.org/licenses/>.
 */

class hn_UI
{

  const TEXT_COLOR = Font.CR_GRAY;

  ui static
  double drawTextCenter( string text
                       , int    color
                       , double scale
                       , double x
                       , double y
                       , Font   font
                       , int    xAdjustment = 0
                       , double alpha = 1.0
                       )
  {
    int    width       = int(scale * Screen.GetWidth());
    int    height      = int(scale * Screen.GetHeight());
    double stringWidth = font.stringWidth(text);
    x  = (width * x) - stringWidth / 2;
    y *= height;
    double margin = 4.0;
    if      (x < margin)                       { x = margin; }
    else if (x > width - stringWidth - margin) { x = width - stringWidth - margin; }

    Screen.drawText( font, color, x, y, text
                   , DTA_KeepRatio,     true
                   , DTA_VirtualWidth,  width
                   , DTA_VirtualHeight, height
                   , DTA_Alpha,         alpha
                   );

    return (font.getHeight() / scale) / Screen.getHeight();
  }

} // class hn_UI
