import tinytinycolor from 'tinytinycolor'
import _ from 'lodash'

class Color {
  constructor(stringOrColor) {
    this._color = new tinytinycolor(stringOrColor)
  }

  toString(): string {
    return this._color.toHexString()
  }

  darken(val: number): Color {
    return new Color(tinytinycolor.darken(this._color, val))
  }

  lighten(val: number): Color {
    return new Color(tinytinycolor.lighten(this._color, val))
  }
}

export default Color
