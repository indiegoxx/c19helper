///
/// Created by Giovanni Terlingen
/// See lICENSE file for more information.
///
import 'dart:ui';

import 'package:built_path_annotations/built_path_annotations.dart';
part 'manipurmap_svg_data.svg_path.g.dart';


/// We can open our exported SVG image, then we put all SVG data we have in the
/// property it belongs to. Our build runner will create Paths for us to use
/// within the app. Run command: flutter packages pub run build_runner build
class ManipurMapSvgData {

  @SvgPath(
      'M170 156 168 155 168 155 170 152 165 151 165 149 162 149 159 145 157 145 157 145 155 142 150 143 146 140 149 141 149 137 147 135 147 129 146 127 146 123 144 119 141 118 143 114 142 109 144 107 145 101 148 99 152 100 159 97 165 94 172 94 179 90 189 87 198 78 203 77 213 77 214 87 212 92 209 96 211 100 209 101 207 106 204 109 201 113 199 121 200 124 196 130 194 130 194 128 193 131 190 130 189 139 185 146 180 149 176 160 170 159 170 159 170 156M181 15 180 19 175 29 176 30 174 30 172 36 171 36 172 36 171 38 170 44 165 51 164 55 160 60 155 62 155 65 152 66 151 69 148 67 134 69 125 66 127 58 121 53 124 46 124 42 120 40 116 39 115 39 115 38 112 36 105 35 103 31 102 30 102 28 101 26 99 25 97 26 96 25 97 20 103 20 105 17 108 18 112 17 120 19 123 16 126 17 125 14 127 13 130 16 131 15 133 19 135 18 136 21 135 21 138 23 142 23 144 19 145 20 146 19 148 19 147 22 151 27 159 24 164 25 171 21 175 21 176 14 183 10 184 12 181 15M116 39 115 40 116 40 115 41 113 43 112 47 115 48 120 54 120 54 119 54 118 55 116 56 113 56 107 62 104 62 100 70 98 71 101 78 101 81 103 88 103 89 103 89 100 90 101 97 96 104 98 112 98 112 98 112 94 117 94 117 95 118 96 119 96 119 96 119 83 118 81 118 79 117 74 114 72 117 70 117 65 115 54 115 53 117 50 117 49 124 46 125 45 128 46 130 41 133 39 136 38 137 35 137 31 132 31 132 30 131 29 131 29 131 32 129 33 125 26 119 26 119 26 119 29 117 28 111 29 112 32 109 32 107 33 107 32 106 34 105 33 104 35 103 33 100 35 100 34 98 37 97 35 95 36 92 34 92 34 89 35 89 37 85 41 86 43 81 45 79 46 75 46 69 51 62 51 60 56 54 61 51 59 49 62 52 62 56 66 56 65 60 72 59 75 62 76 65 78 65 85 51 85 49 87 48 87 44 90 44 94 38 98 36 102 30 103 31M115 97 117 96 115 103 115 104 113 104 114 107 115 108 113 111 116 111 115 111 119 114 117 117 117 117 118 118 117 125 117 125 117 125 118 129 118 129 114 132 114 135 117 136 117 138 117 138 116 138 112 143 114 143 114 143 114 146 114 148 113 151 114 151 110 151 109 154 109 154 108 154 108 152 111 150 108 149 110 145 107 148 107 147 104 145 105 143 102 142 103 139 101 137 101 135 105 133 106 136 109 137 110 136 111 132 110 131 109 126 109 126 105 129 101 126 97 127 100 123 99 118 102 114 102 110 106 101 107 98 109 97 110 94 111 94 114 95 115 96 115 96 111 100 111 100 111 100 114 101 115 97M114 151 116 148 120 148 120 148 120 151 126 152 127 152 128 155 128 155 127 155 128 156 127 157 127 158 127 159 127 159 127 160 127 164 128 164 128 164 128 164 131 163 130 164 130 165 127 166 127 166 126 165 124 165 126 165 124 162 122 163 123 160 121 159 121 158 121 158 121 158 120 160 120 162 120 162 120 164 118 165 120 166 120 166 117 167 119 168 117 169 116 170 116 168 116 169 116 169 115 170 115 170 114 170 114 170 115 174 115 174 114 173 114 174 113 174 113 174 113 174 112 176 113 177 112 178 113 180 112 183 112 183 113 183 113 185 111 185 112 188 111 188 112 190 113 190 112 196 113 197 110 198 109 196 110 194 110 194 108 193 109 190 109 188 110 187 109 186 109 186 109 185 109 185 109 183 107 182 107 181 109 180 107 179 109 177 107 177 107 174 106 170 107 169 106 168 111 159 110 158 111 157 109 155 109 154M109 185 108 184 108 184 108 183 107 183 107 183 107 182 105 182 105 181 106 181 105 180 107 179 106 179 106 176 103 176 103 178 103 177 102 179 102 176 99 177 100 175 97 174 98 172 99 174 99 173 99 174 102 174 102 172 99 171 101 167 99 167 99 169 98 169 98 171 95 170 93 171 92 169 91 171 89 171 89 169 89 168 91 162 93 160 93 150 92 148 93 145 94 144 93 143 93 142 93 141 94 141 94 140 95 134 97 132 97 127M109 188 110 187 109 186M130 165 132 168 137 168 138 171 143 173 143 184 149 189 150 191 149 206 155 209 156 213 154 217 152 216 153 219 148 229 148 232 145 233 144 244 142 243 142 245 141 246 139 245 137 238 131 238 130 235 127 233 122 234 118 231 112 230 108 233 102 233 98 228 96 223 94 223 94 223 98 211 98 211 98 211 98 210 99 206 100 205 103 202 105 199 107 196 108 197 108 196 109 196M94 223 94 224 80 222 78 227 76 229 72 226 71 229 66 231 60 227 61 225 57 221 55 214 50 212 52 199 62 191 64 176 49 173 47 171 48 165 51 162 52 158 54 156 51 154 52 149 53 148 53 148 59 153 61 148 64 151 66 149 69 150 70 148 73 146 76 149 80 144 83 146 84 144 89 143 91 144 92 142 93 142 93 142M115 104 114 105 117 105 119 105 120 103 119 103 121 102 119 100 119 100 120 100 121 100 122 103 123 102 123 102 123 99 119 98 119 96 124 98 123 96 124 96 125 98 126 98 127 98 127 92 125 93 127 91 127 86 128 85 128 89 131 90 129 90 128 92 130 91 131 92 129 93 129 94 131 94 129 95 128 97 130 96 130 98 132 98 130 99 132 100 132 108 135 107 136 105 139 102 140 100 141 103 138 108 137 111 135 112 137 115 135 116 133 126 132 126 132 128 131 128 131 129 132 129 131 132 133 131 135 133 129 136 128 135 126 138 125 133 122 136 120 135 119 134 120 132 118 130 118 129 118 129 118 129M31 132 31 132 30 133 29 135 31 135 31 136 30 136 30 136 32 140 30 141 31 146 29 147 30 149 28 149 28 149 29 150 26 153 20 151 15 148 17 147 14 145 15 143 14 141 15 141 15 138 16 138 17 135 16 134 14 130 15 130 18 126 17 125 17 121 18 117 20 116 19 117 22 117 23 120 26 118 26 119M146 140 145 140 145 140 141 143 139 141 138 140 137 136 136 136 136 136 139 135 139 133 142 133 139 132 140 128 139 130 137 129 137 130 136 133 135 133 135 133M93 141 93 141 92 141 90 139 93 136 92 133 94 131 92 125 94 123 95 119 96 119 96 119 96 119M151 69 147 70 144 73 145 74 143 74 141 76 141 76 140 81 139 83 139 83 143 87 142 92 142 92 142 92 146 100 145 101 145 101M139 141 140 142 138 143 137 143 136 145 137 145 136 145 136 147 137 148 137 149 138 148 138 149 139 149 138 149 140 153 135 149 134 152 133 149 133 153 134 155 136 155 134 156 134 156 133 154 132 155 133 154 132 153 130 154 129 151 129 151 129 151 129 155 129 155 128 155 128 155M170 159 170 159 174 160 173 160 173 164 174 166 172 170 168 172 170 174 167 180 164 180 164 187 162 192 160 193 158 201 156 202 155 209M184 12 187 7 190 6 197 1 195 3 195 4 194 7 196 7 195 8 191 15 193 17 192 18 193 19 191 25 194 26 199 30 206 33 204 38 201 39 201 45 195 56 195 61 194 63 198 68 199 67 202 70 207 72 208 71 211 74 213 74 214 76 203 77M52 149 52 149 46 148 46 148 45 149 39 149 39 149 36 154 37 156 33 156 31 159 28 155 27 156 26 155 26 153M50 212 46 210 47 212 45 212 45 217 39 217 35 221 37 216 35 213 31 213 31 216 30 217 25 217 25 214 22 212 20 216 17 218 17 214 14 210 11 212 4 209 2 209 4 206 4 204 6 202 5 198 7 198 8 195 7 194 8 193 5 190 6 188 6 187 10 179 7 178 8 172 6 169 8 170 10 169 9 167 11 161 9 159 11 155 11 152 13 150 12 148 15 148')
  static Path get manipurBoundary => _$ManipurMapSvgData_manipurBoundary;
  
  @SvgPath('M97 127 101 126 105 129 109 126 109 126 110 131 111 132 110 136 109 137 106 136 105 133 101 135 101 137 103 139 102 142 105 143 104 145 107 147 107 148 110 145 108 149 111 150 108 152 108 154 109 154 109 155 111 157 110 158 111 159 106 168 107 169 106 170 107 174 107 177 109 177 107 179 109 180 107 181 107 182 109 183 109 185 108 184 108 184 108 183 107 183 107 183 107 182 105 182 105 181 106 181 105 180 107 179 106 179 106 176 103 176 103 178 103 177 102 179 102 176 99 177 100 175 97 174 98 172 99 174 99 173 99 174 102 174 102 172 99 171 101 167 99 167 99 169 98 169 98 171 95 170 93 171 92 169 91 171 89 171 89 169 89 168 91 162 93 160 93 150 92 148 93 145 94 144 93 143 93 142 93 141 94 141 94 140 95 134 97 132ZM109 186 110 187 109 188 110 187Z')
  static Path get bishnupur  => _$ManipurMapSvgData_bishnupur;
  
  @SvgPath('M109 196 110 198 113 197 112 196 113 190 112 190 111 188 112 188 111 185 113 185 113 183 112 183 112 183 113 180 112 178 113 177 112 176 113 174 113 174 113 174 114 174 114 173 115 174 115 174 114 170 114 170 115 170 115 170 116 169 116 169 116 168 116 170 117 169 119 168 117 167 120 166 120 166 118 165 120 164 120 162 120 162 120 160 121 158 121 158 121 158 121 159 123 160 122 163 124 162 126 165 124 165 126 165 127 166 127 166 130 165 132 168 137 168 138 171 143 173 143 184 149 189 150 191 149 206 155 209 156 213 154 217 152 216 153 219 148 229 148 232 145 233 144 244 142 243 142 245 141 246 139 245 137 238 131 238 130 235 127 233 122 234 118 231 112 230 108 233 102 233 98 228 96 223 94 223 94 223 98 211 98 211 98 211 98 210 99 206 100 205 103 202 105 199 107 196 108 197 108 196Z')
  static Path get  chandel => _$ManipurMapSvgData_chandel;
  
  @SvgPath('M109 196 108 196 108 197 107 196 105 199 103 202 100 205 99 206 98 210 98 211 98 211 98 211 94 223 94 223 94 224 80 222 78 227 76 229 72 226 71 229 66 231 60 227 61 225 57 221 55 214 50 212 52 199 62 191 64 176 49 173 47 171 48 165 51 162 52 158 54 156 51 154 52 149 53 148 53 148 59 153 61 148 64 151 66 149 69 150 70 148 73 146 76 149 80 144 83 146 84 144 89 143 91 144 92 142 93 142 93 142 93 143 94 144 93 145 92 148 93 150 93 160 91 162 89 168 89 169 89 171 91 171 92 169 93 171 95 170 98 171 98 169 99 169 99 167 101 167 99 171 102 172 102 174 99 174 99 173 99 174 98 172 97 174 100 175 99 177 102 176 102 179 103 177 103 178 103 176 106 176 106 179 107 179 105 180 106 181 105 181 105 182 107 182 107 183 107 183 108 183 108 184 108 184 109 185 109 185 109 186 109 186 110 187 109 188 109 190 108 193 110 194 110 194Z')
  static Path get churachandpur  => _$ManipurMapSvgData_churachandpur;
  
  @SvgPath('M118 129 118 129 117 125 117 125 117 125 118 118 117 117 117 117 119 114 115 111 116 111 113 111 115 108 114 107 113 104 115 104 114 105 117 105 119 105 120 103 119 103 121 102 119 100 119 100 120 100 121 100 122 103 123 102 123 102 123 99 119 98 119 96 124 98 123 96 124 96 125 98 126 98 127 98 127 92 125 93 127 91 127 86 128 85 128 89 131 90 129 90 128 92 130 91 131 92 129 93 129 94 131 94 129 95 128 97 130 96 130 98 132 98 130 99 132 100 132 108 135 107 136 105 139 102 140 100 141 103 138 108 137 111 135 112 137 115 135 116 133 126 132 126 132 128 131 128 131 129 132 129 131 132 133 131 135 133 129 136 128 135 126 138 125 133 122 136 120 135 119 134 120 132 118 130 118 129 118 129Z')
  static Path get  imphalEast => _$ManipurMapSvgData_imphalEast;
  
  @SvgPath('M115 97 117 96 115 103 115 104 113 104 114 107 115 108 113 111 116 111 115 111 119 114 117 117 117 117 118 118 117 125 117 125 117 125 118 129 118 129 114 132 114 135 117 136 117 138 117 138 116 138 112 143 114 143 114 143 114 146 114 148 113 151 114 151 110 151 109 154 109 154 108 154 108 152 111 150 108 149 110 145 107 148 107 147 104 145 105 143 102 142 103 139 101 137 101 135 105 133 106 136 109 137 110 136 111 132 110 131 109 126 109 126 105 129 101 126 97 127 100 123 99 118 102 114 102 110 106 101 107 98 109 97 110 94 111 94 114 95 115 96 115 96 111 100 111 100 111 100 114 101Z')
  static Path get  imphalWest => _$ManipurMapSvgData_imphalWest;
  
  @SvgPath('M181 15 180 19 175 29 176 30 174 30 172 36 171 36 172 36 171 38 170 44 165 51 164 55 160 60 155 62 155 65 152 66 151 69 148 67 134 69 125 66 127 58 121 53 124 46 124 42 120 40 116 39 115 39 115 38 112 36 105 35 103 31 102 30 102 28 101 26 99 25 97 26 96 25 97 20 103 20 105 17 108 18 112 17 120 19 123 16 126 17 125 14 127 13 130 16 131 15 133 19 135 18 136 21 135 21 138 23 142 23 144 19 145 20 146 19 148 19 147 22 151 27 159 24 164 25 171 21 175 21 176 14 183 10 184 12Z')
  static Path get  senapati => _$ManipurMapSvgData_senapati;
  
  @SvgPath('M112 47 115 48 120 54 120 54 119 54 118 55 116 56 113 56 107 62 104 62 100 70 98 71 101 78 101 81 103 88 103 89 103 89 100 90 101 97 96 104 98 112 98 112 98 112 94 117 94 117 95 118 96 119 96 119 96 119 83 118 81 118 79 117 74 114 72 117 70 117 65 115 54 115 53 117 50 117 49 124 46 125 45 128 46 130 41 133 39 136 38 137 35 137 31 132 31 132 30 131 29 131 29 131 32 129 33 125 26 119 26 119 26 119 29 117 28 111 29 112 32 109 32 107 33 107 32 106 34 105 33 104 35 103 33 100 35 100 34 98 37 97 35 95 36 92 34 92 34 89 35 89 37 85 41 86 43 81 45 79 46 75 46 69 51 62 51 60 56 54 61 51 59 49 62 52 62 56 66 56 65 60 72 59 75 62 76 65 78 65 85 51 85 49 87 48 87 44 90 44 94 38 98 36 102 30 103 31 105 35 112 36 115 38 115 39 116 39 115 40 116 40 115 41 113 43Z')
  static Path get tamenglong  => _$ManipurMapSvgData_tamenglong;
  
  @SvgPath('M114 151 113 151 114 148 114 146 114 143 114 143 112 143 116 138 117 138 117 138 117 136 114 135 114 132 118 129 118 129 118 129 118 130 120 132 119 134 120 135 122 136 125 133 126 138 128 135 129 136 135 133 135 133 136 133 137 130 137 129 139 130 140 128 139 132 142 133 139 133 139 135 136 136 136 136 137 136 138 140 139 141 140 142 138 143 137 143 136 145 137 145 136 145 136 147 137 148 137 149 138 148 138 149 139 149 138 149 140 153 135 149 134 152 133 149 133 153 134 155 136 155 134 156 134 156 133 154 132 155 133 154 132 153 130 154 129 151 129 151 129 151 129 155 129 155 128 155 128 155 128 155 127 152 126 152 120 151 120 148 120 148 116 148Z')
  static Path get  thoubal => _$ManipurMapSvgData_thoubal;
  
  @SvgPath('M203 77 198 78 189 87 179 90 172 94 165 94 159 97 152 100 148 99 145 101 145 101 146 100 142 92 142 92 142 92 143 87 139 83 139 83 140 81 141 76 141 76 143 74 145 74 144 73 147 70 151 69 152 66 155 65 155 62 160 60 164 55 165 51 170 44 171 38 172 36 171 36 172 36 174 30 176 30 175 29 180 19 181 15 184 12 187 7 190 6 194 1 195 3 195 4 194 7 196 7 195 8 191 15 193 17 192 18 193 19 191 25 194 26 199 30 206 33 204 38 201 39 201 45 195 56 195 61 194 63 198 68 199 67 202 70 207 72 208 71 211 74 213 74 214 76Z')
  static Path get  ukhrul => _$ManipurMapSvgData_ukhrul;
  
  @SvgPath('M145 101 144 107 142 109 143 114 141 118 144 119 146 123 146 127 147 129 147 135 149 137 149 141 146 140 145 140 145 140 141 143 139 141 138 140 137 136 136 136 136 136 139 135 139 133 142 133 139 132 140 128 139 130 137 129 137 130 136 133 135 133 135 133 133 131 131 132 132 129 131 129 131 128 132 128 132 126 133 126 135 116 137 115 135 112 137 111 138 108 141 103 140 100 139 102 136 105 135 107 132 108 132 100 130 99 132 98 130 98 130 96 128 97 129 95 131 94 129 94 129 93 131 92 130 91 128 92 129 90 131 90 128 89 128 85 127 86 127 91 125 93 127 92 127 98 126 98 125 98 124 96 123 96 124 98 119 96 119 98 123 99 123 102 123 102 122 103 121 100 120 100 119 100 119 100 121 102 119 103 120 103 119 105 117 105 114 105 115 104 115 103 117 96 115 97 114 101 111 100 111 100 111 100 115 96 115 96 114 95 111 94 110 94 109 97 107 98 106 101 102 110 102 114 99 118 100 123 97 127 97 132 95 134 94 140 94 141 93 141 93 141 92 141 90 139 93 136 92 133 94 131 92 125 94 123 95 119 96 119 96 119 96 119 95 118 94 117 94 117 98 112 98 112 98 112 96 104 101 97 100 90 103 89 103 89 103 88 101 81 101 78 98 71 100 70 104 62 107 62 113 56 116 56 118 55 119 54 120 54 120 54 115 48 112 47 113 43 115 41 116 40 115 40 116 39 120 40 124 42 124 46 121 53 127 58 125 66 134 69 148 67 151 69 147 70 144 73 145 74 143 74 141 76 141 76 140 81 139 83 139 83 143 87 142 92 142 92 142 92 146 100 145 101Z')
  static Path get  kangpokpi => _$ManipurMapSvgData_kangpokpi;
  
  @SvgPath('M146 140 150 143 155 142 157 145 157 145 159 145 162 149 165 149 165 151 170 152 168 155 168 155 170 156 170 159 170 159 170 159 174 160 173 160 173 164 174 166 172 170 168 172 170 174 167 180 164 180 164 187 162 192 160 193 158 201 156 202 155 209 149 206 150 191 149 189 143 184 143 173 138 171 137 168 132 168 130 165 130 164 131 163 128 164 128 164 128 164 127 164 127 160 127 159 127 159 127 158 127 157 128 156 127 155 128 155 128 155 129 155 129 155 129 151 129 151 129 151 130 154 132 153 133 154 132 155 133 154 134 156 134 156 136 155 134 155 133 153 133 149 134 152 135 149 140 153 138 149 139 149 138 149 138 148 137 149 137 148 136 147 136 145 137 145 136 145 137 143 138 143 140 142 139 141 141 143 145 140 145 140Z')
  static Path get  tengnoupal => _$ManipurMapSvgData_tengnoupal;
  
  @SvgPath('M52 149 51 154 54 156 52 158 51 162 48 165 47 171 49 173 64 176 62 191 52 199 50 212 46 210 47 212 45 212 45 217 39 217 35 221 37 216 35 213 31 213 31 216 30 217 25 217 25 214 22 212 20 216 17 218 17 214 14 210 11 212 4 209 2 209 4 206 4 204 6 202 5 198 7 198 8 195 7 194 8 193 5 190 6 188 6 187 10 179 7 178 8 172 6 169 8 170 10 169 9 167 11 161 9 159 11 155 11 152 13 150 12 148 15 148 20 151 26 153 26 155 27 156 28 155 31 159 33 156 37 156 36 154 39 149 39 149 45 149 46 148 46 148 52 149Z')
  static Path get  pherzawl => _$ManipurMapSvgData_pherzawl;
  
  @SvgPath('M31 132 35 137 38 137 39 136 41 133 46 130 45 128 46 125 49 124 50 117 53 117 54 115 65 115 70 117 72 117 74 114 79 117 81 118 83 118 96 119 96 119 96 119 96 119 96 119 95 119 94 123 92 125 94 131 92 133 93 136 90 139 92 141 93 141 93 141 93 142 93 142 92 142 91 144 89 143 84 144 83 146 80 144 76 149 73 146 70 148 69 150 66 149 64 151 61 148 59 153 53 148 53 148 52 149 52 149 46 148 46 148 45 149 39 149 39 149 36 154 37 156 33 156 31 159 28 155 27 156 26 155 26 153 29 150 28 149 28 149 30 149 29 147 31 146 30 141 32 140 30 136 30 136 31 136 31 135 29 135 30 133 31 132Z')
  static Path get  noney => _$ManipurMapSvgData_noney;
  
  @SvgPath('M170 156 168 155 168 155 170 152 165 151 165 149 162 149 159 145 157 145 157 145 155 142 150 143 146 140 149 141 149 137 147 135 147 129 146 127 146 123 144 119 141 118 143 114 142 109 144 107 145 101 148 99 152 100 159 97 165 94 172 94 179 90 189 87 198 78 203 77 213 77 214 87 212 92 209 96 211 100 209 101 207 106 204 109 201 113 199 121 200 124 196 130 194 130 194 128 193 131 190 130 189 139 185 146 180 149 176 160 170 159 170 159Z')
  static Path get  kamjong => _$ManipurMapSvgData_kamjong;
  
  @SvgPath('M26 119 26 119 26 119 33 125 32 129 29 131 29 131 30 131 31 132 31 132 31 132 30 133 29 135 31 135 31 136 30 136 30 136 32 140 30 141 31 146 29 147 30 149 28 149 28 149 29 150 26 153 20 151 15 148 17 147 14 145 15 143 14 141 15 141 15 138 16 138 17 135 16 134 14 130 15 130 18 126 17 125 17 121 18 117 20 116 19 117 22 117 23 120 26 118Z')
  static Path get  jiribam => _$ManipurMapSvgData_jiribam;
  
  @SvgPath('M109 154 109 154 110 151 114 151 116 148 120 148 120 148 120 151 126 152 127 152 128 155 128 155 127 155 128 156 127 157 127 158 127 159 127 159 127 160 127 164 128 164 128 164 128 164 131 163 130 164 130 165 127 166 127 166 126 165 124 165 126 165 124 162 122 163 123 160 121 159 121 158 121 158 121 158 120 160 120 162 120 162 120 164 118 165 120 166 120 166 117 167 119 168 117 169 116 170 116 168 116 169 116 169 115 170 115 170 114 170 114 170 115 174 115 174 114 173 114 174 113 174 113 174 113 174 112 176 113 177 112 178 113 180 112 183 112 183 113 183 113 185 111 185 112 188 111 188 112 190 113 190 112 196 113 197 110 198 109 196 110 194 110 194 108 193 109 190 109 188 110 187 109 186 109 186 109 185 109 185 109 183 107 182 107 181 109 180 107 179 109 177 107 177 107 174 106 170 107 169 106 168 111 159 110 158 111 157 109 155Z')
  static Path get kakching  => _$ManipurMapSvgData_kakching;
  
}
