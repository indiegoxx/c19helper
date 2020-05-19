///
/// Created by Giovanni Terlingen
/// See lICENSE file for more information.
///
import 'dart:ui';

import 'package:built_path_annotations/built_path_annotations.dart';
part 'haryanamap_svg_data.svg_path.g.dart';


/// We can open our exported SVG image, then we put all SVG data we have in the
/// property it belongs to. Our build runner will create Paths for us to use
/// within the app. Run command: flutter packages pub run build_runner build
class HaryanaMapSvgData {

  @SvgPath(
      'M163 183 165 182 168 183 169 181 171 182 172 181 171 181 171 180 171 180 174 182 176 182 177 182 177 182 179 183 179 184 178 185 179 187 182 188 182 188 182 190 182 190 181 191 181 191 181 196 184 198 185 199 186 199 185 200 185 201 184 202 183 203 184 204 183 205 182 205 180 203 180 203 179 204 178 203 177 204 176 203 176 204 175 204 174 202 172 202 172 197 171 196 169 195 168 197 166 196 165 198 165 198 165 198 165 199 165 200 165 201 164 201 163 201 162 203 161 203 161 202 159 202 158 201 158 201 156 203 155 202 152 200 150 200 150 197 149 197 149 198 148 197 149 193 149 192 149 192M182 190 182 190 183 190 184 190 185 189 186 189 187 188 187 187 187 186 186 186 187 185 187 184 187 184 190 183 191 184 193 183 194 181 194 183 194 183 194 183 195 183 196 185 198 185 197 186 199 186 199 188 201 189 201 189 202 189 202 190 202 191 204 193 203 194 202 195 204 197 204 199 203 200 203 201 207 202 205 203 206 204 205 205 204 205 204 205 204 205 204 205 202 204 201 205 199 204 198 205 198 204 196 204 195 203 193 203 192 201 192 201 191 201 188 200 188 200 188 201 186 200 186 200 186 200 185 200M162 203 162 203 161 203 161 204 161 204 160 205 158 204 159 206 157 206 158 208 157 209 155 209 154 211 152 211 150 214 148 213 148 217 149 219 144 220 143 222 141 223 141 222 141 222 141 218 140 217 139 218 138 217 135 217 136 216 137 216 138 216 135 213 136 212 138 213 138 211 137 211 138 210 137 210 137 210 136 210 136 209 136 209 135 209 133 209 132 209 131 210 130 210 129 209 129 208 128 207 127 207 126 207M124 188 125 186 125 185 125 185M183 205 183 205 183 205 184 205 183 206 182 206 182 208 179 211 180 213 180 215 181 216 180 217 181 218 180 220 181 220 180 223 181 224 183 224 183 224 184 225 186 228 188 229 189 230 190 228 191 229 193 231 193 231 193 232 193 232 190 233 189 235 188 234 187 236 187 236 186 235 185 235 184 233 184 233 183 234 184 235 182 236 182 235 183 234 181 234 181 234 181 234 181 236 180 237 179 235 178 236 176 234 174 233 173 236 174 237 175 238 176 237 176 239 175 240 173 239 172 239 172 240 171 240 169 246 169 245 167 244 167 244 166 245 165 246 164 244 165 243 164 242 164 242 166 242 164 241 164 240 166 235 165 234 165 232 167 233 167 232 167 228 168 228 168 226 166 226 167 221 166 221 169 210 167 209 168 209 166 209 164 206 165 205 163 205 163 204 161 204M204 205 203 205 203 206 204 206 204 206 206 206 207 206 207 206 206 207 206 208 204 208 204 209 203 210 204 211 203 213 202 212 202 212 202 213 202 214 202 214 202 214 202 214 202 214 204 216 202 217 204 218 204 218 206 221 205 222 205 222 205 223 206 223 206 223 206 225 205 225 205 225 204 226 203 225 202 225 202 228 201 229 201 229 201 229 199 228 198 228 198 228 198 229 198 231 198 231 195 231 194 231 193 231M99 188 100 186 99 186 98 184 101 184 101 183 99 183 99 182 99 182 98 182 97 184 93 182 94 181 94 179 96 178 95 176 96 176 99 175 103 175 110 170 112 171 112 169 113 170 113 172 114 172 114 171 114 169 114 169 117 170 118 169 121 170 121 168 121 168 121 166 122 165 123 165 124 162 125 162 125 160 127 160 131 162 130 165 131 166 130 167 130 168 131 168 132 169 133 168 133 168M179 28 179 28 178 28 177 28 177 28 176 29 174 29 174 29 173 30 174 31 172 32 172 33 170 34 169 34 168 35 167 35 166 36 166 37 165 36 165 35 165 35 164 34 166 33 166 31 164 29 165 29 165 29 165 28 166 26 165 26 166 26 166 24 165 24 165 23 164 23 163 22 162 22 163 19 161 21 161 20 160 20 160 19 160 19 160 19 159 18 161 16 161 15 161 15 160 14 160 13 160 13 161 10 161 9 161 7 159 7 159 6 157 4 156 2 156 2 160 3 161 3 162 4 165 2 165 3 167 4 168 6 167 8 169 8 171 9 172 9 172 11 171 12 172 12 172 14 172 14 173 14 173 15 174 15 174 14 175 15 177 14 179 16 182 19 182 21 182 22 182 25 179 28 179 28 179 28 180 29 180 29 183 31 184 32 184 34 185 35 185 35 186 34 188 34 189 35 189 35 189 35 190 35 192 37 194 36 195 38 196 37 197 38 197 39 197 40 201 36 201 38 198 39 200 41 203 39 204 40 204 38 205 37 207 41 207 41 208 41 209 42 209 42 210 43 210 43 209 46 209 47 206 49 206 51 202 57 201 58 199 58 199 59 199 61 197 62 197 62 198 63 198 63 196 64 193 66 191 66 189 67 189 71 187 72 186 75 184 75 183 75 183 74 182 73 182 73 182 73 180 73 180 72 179 71 179 71 179 71 178 70 177 68 176 68 175 65 175 64 175 64 175 63 176 62 176 61 175 61 175 59 175 58 176 58 177 58 178 57 176 56 176 54 177 53 179 53 181 54 181 53 181 53 179 52 180 50 180 49 180 49 180 49 182 48 182 47 183 47 182 46 182 45 181 43 181 43 181 43 182 43 182 43 182 43 183 42 182 38 182 37 182 36 184 34 184 34M179 71 179 71 179 71 177 74 177 74 174 75 173 74 172 74 170 74 168 76 168 77 166 76 166 77 164 77 163 79 162 80 160 78 159 78 158 78 157 80 155 81 154 80 154 80 153 80 153 80 151 78 150 76 149 77 144 76 142 78 142 77 140 78 136 77 137 74 136 72 135 73 134 73 134 71 134 70 133 68 136 63 136 63 137 63 138 63 139 65 141 65 143 63 145 64 144 65 146 65 148 63 147 62 148 61 147 59 147 59 147 59 147 59 148 59 150 57 150 56 150 56 155 56 157 54 159 54 159 51 159 51 159 51 159 51 161 52 161 51 162 52 162 53 164 54 163 55 165 56 166 55 168 56 167 57 167 58 168 59 170 58 175 61M153 80 153 80 152 83 152 85 150 88 151 89 151 93 152 93 151 96 150 95 148 95 145 99 142 98 141 100 140 100 141 101 140 103 140 105 139 107 138 107 138 107 137 105 137 105 137 105 137 105 136 105 136 104 134 106 134 105 130 106 130 106 128 104 129 103 128 102 125 101 124 102 125 104 123 104 123 104 123 103 123 102 121 101 121 99 118 98 119 96 118 95 116 94 117 92 117 90 118 90 118 88 120 86 120 84 119 84 119 83 119 83 119 83 119 83 120 83 120 82 120 82 121 82 121 81 121 81 121 81 122 80 122 80 119 79 118 79 118 79 118 76 117 76 119 72 119 70 121 69 119 69 119 68 122 64 121 62 120 62 120 61 119 59 121 60 122 61 124 62 125 62 126 63 128 63 129 61 127 60 128 59 129 61 132 62 131 60 132 59 131 58 133 56 133 56 134 58 133 59 133 59 134 59 134 60 134 60 135 61 136 63 136 63 136 63 136 63M186 75 186 75 186 75 183 77 184 80 182 82 182 85 182 86 180 88 179 88 179 89 179 89 179 89 180 90 180 91 180 92 180 92 181 93 181 94 181 94 181 94 180 95 180 97 179 97 178 98 178 101 177 101 179 104 178 105 177 106 179 109 179 109 179 109 179 109 179 110 175 113 175 113 174 112 174 111 173 112 171 112 166 109 165 109 165 111 163 109 161 109 159 107 159 107 157 111 157 111 156 110 155 111 155 111 155 110 154 110 154 111 152 109 152 109 150 110 148 109 147 110 145 110 145 110 144 111 140 111 140 110 140 110 138 107 138 107M155 111 153 115 154 115 153 117 148 118 148 118 148 120 147 122 147 123 147 123 147 123 150 125 150 126 148 126 148 126 145 124 144 125 142 125 142 126 143 129 142 130 140 130 140 128 136 128 138 132 139 133 137 135 137 139 136 139 136 139 134 141 132 140 130 141 128 139 125 139 125 139 126 137 126 137 126 137 125 136 125 132 124 130 120 129 120 128 119 127 118 124 119 122 117 120 119 118 119 116 118 115 118 115 116 114 116 114 114 116 113 115 113 115 113 115 111 115 111 113 110 113 110 113 110 113 108 114 107 114 107 113 105 112 106 110 101 108 103 104 103 104 103 104 103 103 103 103 103 101 102 101 103 99 102 97 102 95 101 94 102 91 104 91 107 89 108 90 108 90 108 90 109 90 109 89 110 88 111 87 111 86 112 85 112 85 113 86 113 86 113 86 115 84 117 84 117 84 118 82 118 82 119 83M60 104 60 104 59 106 60 106 58 107 59 109 58 110 60 113 59 114 55 114 54 116 55 117 56 117 56 118 57 119 57 119 57 120 57 120 57 120 55 121 56 123 56 123 56 126 56 128 54 128 52 126 51 126 51 127 51 127 48 128 48 129 45 129 43 124 41 124 40 125 37 125 37 123 37 122 36 120 36 118 30 115 28 116 26 119 24 119 23 119 22 118 18 118 17 121 14 121 14 118 12 117 12 114 10 114 10 111 10 111 13 111 14 108 15 106 15 106 12 103 13 99 13 98 13 97 15 89 13 88 12 89 11 89 10 90 6 90 6 89 6 88 6 84 8 83 10 83 11 80 10 78 8 77 9 75 9 74 14 77 17 78 17 77 17 76 17 76 19 75 21 72 21 72 22 73 26 73 28 71 28 71 29 72 28 73 29 73 31 74 33 73 34 74 33 75 35 74 37 78 39 78 40 80 41 81 43 79 45 80 46 77 46 77 46 77 46 77 47 77 48 80 46 81 48 83 48 83 47 84 47 85 49 85 50 87 51 87 50 85 51 84 51 84 51 83 53 82 52 82 54 83 54 86 55 86 56 89 56 89 55 91 54 90 53 91 53 91 54 94 51 96 52 97 52 98 55 100 55 102 56 104 55 105 58 104 58 104 60 104 60 104 60 104 61 102 59 100 59 100 59 99 59 99 59 99 61 98 62 96 62 95 62 95 64 96 63 93 64 92 66 92 65 91 65 91 66 90 67 88 67 88 67 88 70 87 70 85 70 85 74 87 74 87 74 87 74 89 75 88 77 88 78 90 80 89 81 89 81 89 82 88 82 87 82 87 82 87 83 87 84 87 84 87 86 89 86 89 87 85 89 85 89 85 90 85 91 84 91 84 93 85 93 85 94 85 95 85 95 86 97 88 97 89 99 90 99 89 101 91 102 91 102 91M103 103 101 102 101 102 101 102 100 104 99 104 99 105 97 105 97 104 96 104 96 106 95 107 93 107 90 108 89 110 91 113 90 115 88 116 87 115 88 114 86 113 81 114 80 115 80 118 79 119 80 120 79 120 78 119 78 119 75 118 74 116 73 116 72 116 72 117 71 117 71 117 71 118 71 118 71 119 69 119 69 118 68 118 67 120 66 120 66 122 63 123 63 123 63 124 61 124 60 125 59 125 59 127 56 127 56 126M125 139 125 139 124 141 121 141 122 145 122 145 121 145 120 146 120 146 119 146 119 145 118 144 119 143 118 142 114 142 114 143 112 142 110 143 110 144 110 144 109 143 108 143 108 143 108 141 106 141 104 140 103 141 104 146 104 146 103 145 100 144 99 147 98 147 96 149 96 150 96 150 96 151 95 152 95 152 95 152 94 152 92 151 92 151 90 153 90 153 90 153 90 153 85 152 85 152 83 150 82 150 81 147 80 147 78 147 76 148 75 148 74 148 75 148 74 145 74 145 73 145 71 145 69 145 70 143 69 141 66 141 66 137 67 137 66 136 65 135 64 135 64 135 65 135 65 133 67 133 67 132 67 130 66 129 67 127 67 127 67 126 67 126 65 127 63 129 61 128 63 124M179 109 179 109 179 109 179 111 179 112 179 112 180 113 181 113 180 113 180 116 181 117 179 118 179 119 179 119 181 120 181 121 181 121 181 123 181 123 181 123 181 123 180 125 180 126 180 126 181 128 179 129 180 131 180 133 180 133 177 134 176 132 175 133 174 132 173 132 170 132 165 129 163 131 158 129 157 127 157 125 156 124 152 127 152 126 151 126 150 125M163 160 164 161 164 161 165 161 166 161 167 161 168 161 168 161 168 161 168 163 167 164 168 166 167 167 169 168 168 170 168 170 168 170 167 170 166 172 167 173 167 173 167 174 167 174 167 174 166 173 165 174 164 173 162 177 160 177 161 179 163 181 163 183 163 183 163 183 159 183 158 185 157 186 156 185 155 186 154 185 151 183 152 188 152 190 153 192 152 194 150 193 150 192 149 192 149 192 148 190 146 189 146 188 144 188 142 190 142 190 142 188 139 188 135 189 134 189 134 186 132 185 130 185 129 186 126 185 125 185 125 185 124 185 124 185 124 184 124 183 127 183 128 178 127 177 128 177 129 174 129 174 130 175 132 176 132 176 132 179 133 179 134 176 134 176 135 176 136 174 134 172 136 172 137 169 134 168 133 168 133 168 133 166 135 165 136 165 140 165 140 164 143 165 144 164 144 164 145 161 146 161 148 160 147 159 147 158 147 158 148 158 148 158 148 158 149 160 149 161 152 162 152 163 151 163 150 165 151 165 152 165 152 164 154 164 155 163 156 165 160 160 161 160 162 159 163 160 161 156 158 156 159 153 159 151 157 151 156 150 156 149 155 148 154 149 153 148 154 145 152 144 148 141 143 141 141 138 139 140 137 139M180 133 180 133 180 135 181 137 181 137 180 138 180 140 182 140 182 143 183 144 184 147 184 150 184 151 186 151 186 152 186 152 186 155 184 154 183 155 185 156 185 157 182 156 181 158 181 158 181 158 180 158 180 158 180 156 179 156 176 154 176 156 175 155 173 158 171 158 170 158 170 159 170 159 170 159 169 159 169 159 169 160 168 159 167 161M98 191 99 190 99 188 99 188 104 187 106 188 107 191 111 191 113 187 113 187 115 187 116 186 116 186 116 188 118 188 118 187 119 187 120 185 120 185 121 186 122 188 124 188 124 188 124 190 125 190 125 192 126 193 127 193 129 193 129 195 129 195 129 196 129 196 129 196 128 197 128 199 128 200 128 201 128 203 127 203 126 205 126 205 125 205 126 207 125 207 124 208 124 208 125 208 125 209 126 209 129 211 127 212 126 212 125 213 125 213 125 213 129 215 128 218 126 219 125 218 125 216 122 215 121 215 121 216 117 216 118 218 120 217 118 219 117 218 116 220 116 222 118 223 116 227 119 228 118 230 119 232 119 232 120 232 120 232 120 234 118 233 117 235 115 233 114 233 114 232 113 231 111 230 111 230 111 232 110 232 110 232 109 231 109 232 105 232 104 231 104 229 104 228 105 227 101 226 101 225 101 225 102 224 104 225 104 223 105 222 103 221 103 220 105 220 105 220 104 219 104 218 105 217 105 217 106 218 107 216 106 216 107 216 108 215 107 214 106 216 104 217 104 216 105 215 104 214 101 214 102 212 104 211 105 211 106 209 107 209 107 208 110 208 110 210 111 210 112 210 111 209 111 208 110 206 109 205 109 204 106 202 107 200 105 198 104 196 103 197 102 195 101 195 100 192 99 192 99 191 98 191 97 191 96 191 94 190 94 190 91 190 91 190 90 189 92 188 92 186 88 185 88 184 86 184 84 182 84 181 84 181 84 180 81 180 81 175 81 175 77 174 77 173 75 171 75 166 75 165 76 164 75 164 73 162 74 158 73 157 72 153 71 151 71 151 73 150 73 150 73 150 73 150 74 148 74 148 74 148M120 146 120 146 120 147 119 149 121 150 121 152 128 153 129 155 127 160 127 160M147 59 147 58 145 57 146 55 147 56 148 56 147 57 147 58 148 57 148 55 146 55 146 54 144 53 145 52 145 52 145 51 144 51 144 51 144 52 142 53 141 53 142 52 142 51 144 50 144 51 146 50 146 50 147 49 150 47 150 46 152 46 154 44 154 43 153 43 153 42 152 42 152 41 152 40 152 40 153 40 154 39 154 39 154 39 154 38 154 38 156 37 157 38 156 38 157 39 159 39 161 37 161 39 163 40 163 41 164 42 164 43 165 43 165 43 167 41 165 40 165 39 165 38 165 38 164 38 165 37 163 38 164 37 165 37 165 37 165 38 165 38 165 38 165 38M143 63 141 62 141 61 143 62 145 62 147 59M164 37 165 36 165 36 165 36')
  static Path get haryanaBoundary => _$HaryanaMapSvgData_haryanaBoundary;
  
  @SvgPath('M60 104 60 104 59 106 60 106 58 107 59 109 58 110 60 113 59 114 55 114 54 116 55 117 56 117 56 118 57 119 57 119 57 120 57 120 57 120 55 121 56 123 56 123 56 126 56 128 54 128 52 126 51 126 51 127 51 127 48 128 48 129 45 129 43 124 41 124 40 125 37 125 37 123 37 122 36 120 36 118 30 115 28 116 26 119 24 119 23 119 22 118 18 118 17 121 14 121 14 118 12 117 12 114 10 114 10 111 10 111 13 111 14 108 15 106 15 106 12 103 13 99 13 98 13 97 15 89 13 88 12 89 11 89 10 90 6 90 6 89 6 88 6 84 8 83 10 83 11 80 10 78 8 77 9 75 9 74 14 77 17 78 17 77 17 76 17 76 19 75 21 72 21 72 22 73 26 73 28 71 28 71 29 72 28 73 29 73 31 74 33 73 34 74 33 75 35 74 37 78 39 78 40 80 41 81 43 79 45 80 46 77 46 77 46 77 46 77 47 77 48 80 46 81 48 83 48 83 47 84 47 85 49 85 50 87 51 87 50 85 51 84 51 84 51 83 53 82 52 82 54 83 54 86 55 86 56 89 56 89 55 91 54 90 53 91 53 91 54 94 51 96 52 97 52 98 55 100 55 102 56 104 55 105 58 104 58 104 60 104Z')
  static Path get sirsa => _$HaryanaMapSvgData_sirsa;

  @SvgPath('M56 126 56 123 56 123 55 121 57 120 57 120 57 120 57 119 57 119 56 118 56 117 55 117 54 116 55 114 59 114 60 113 58 110 59 109 58 107 60 106 59 106 60 104 60 104 60 104 61 102 59 100 59 100 59 99 59 99 59 99 61 98 62 96 62 95 62 95 64 96 63 93 64 92 66 92 65 91 65 91 66 90 67 88 67 88 67 88 70 87 70 85 70 85 74 87 74 87 74 87 74 89 75 88 77 88 78 90 80 89 81 89 81 89 82 88 82 87 82 87 82 87 83 87 84 87 84 87 86 89 86 89 87 85 89 85 89 85 90 85 91 84 91 84 93 85 93 85 94 85 95 85 95 86 97 88 97 89 99 90 99 89 101 91 102 91 102 91 101 94 102 95 102 97 103 99 102 101 103 101 103 103 103 103 101 102 101 102 101 102 100 104 99 104 99 105 97 105 97 104 96 104 96 106 95 107 93 107 90 108 89 110 91 113 90 115 88 116 87 115 88 114 86 113 81 114 80 115 80 118 79 119 80 120 79 120 78 119 78 119 75 118 74 116 73 116 72 116 72 117 71 117 71 117 71 118 71 118 71 119 69 119 69 118 68 118 67 120 66 120 66 122 63 123 63 123 63 124 61 124 60 125 59 125 59 127 56 127Z')
  static Path get fatehabad => _$HaryanaMapSvgData_fatehabad;

  @SvgPath('M119 83 119 83 119 83 119 84 120 84 120 86 118 88 118 90 117 90 117 92 116 94 118 95 119 96 118 98 121 99 121 101 123 102 123 103 123 104 123 104 125 104 124 102 125 101 128 102 129 103 128 104 130 106 130 106 134 105 134 106 136 104 136 105 137 105 137 105 137 105 137 105 138 107 138 107 138 107 140 110 140 110 140 111 144 111 145 110 145 110 147 110 148 109 150 110 152 109 152 109 154 111 154 110 155 110 155 111 155 111 153 115 154 115 153 117 148 118 148 118 148 120 147 122 147 123 147 123 147 123 150 125 150 126 148 126 148 126 145 124 144 125 142 125 142 126 143 129 142 130 140 130 140 128 136 128 138 132 139 133 137 135 137 139 136 139 136 139 134 141 132 140 130 141 128 139 125 139 125 139 126 137 126 137 126 137 125 136 125 132 124 130 120 129 120 128 119 127 118 124 119 122 117 120 119 118 119 116 118 115 118 115 116 114 116 114 114 116 113 115 113 115 113 115 111 115 111 113 110 113 110 113 110 113 108 114 107 114 107 113 105 112 106 110 101 108 103 104 103 104 103 104 103 103 103 103 103 101 102 101 103 99 102 97 102 95 101 94 102 91 104 91 107 89 108 90 108 90 108 90 109 90 109 89 110 88 111 87 111 86 112 85 112 85 113 86 113 86 113 86 115 84 117 84 117 84 118 82 118 82Z')
  static Path get jind => _$HaryanaMapSvgData_jind;

  @SvgPath('M136 63 136 63 133 68 134 70 134 71 134 73 135 73 136 72 137 74 136 77 140 78 142 77 142 78 144 76 149 77 150 76 151 78 153 80 153 80 152 83 152 85 150 88 151 89 151 93 152 93 151 96 150 95 148 95 145 99 142 98 141 100 140 100 141 101 140 103 140 105 139 107 138 107 138 107 137 105 137 105 137 105 137 105 136 105 136 104 134 106 134 105 130 106 130 106 128 104 129 103 128 102 125 101 124 102 125 104 123 104 123 104 123 103 123 102 121 101 121 99 118 98 119 96 118 95 116 94 117 92 117 90 118 90 118 88 120 86 120 84 119 84 119 83 119 83 119 83 119 83 120 83 120 82 120 82 121 82 121 81 121 81 121 81 122 80 122 80 119 79 118 79 118 79 118 76 117 76 119 72 119 70 121 69 119 69 119 68 122 64 121 62 120 62 120 61 119 59 121 60 122 61 124 62 125 62 126 63 128 63 129 61 127 60 128 59 129 61 132 62 131 60 132 59 131 58 133 56 133 56 134 58 133 59 133 59 134 59 134 60 134 60 135 61 136 63 136 63 136 63Z')
  static Path get kaithal => _$HaryanaMapSvgData_kaithal;

  @SvgPath('M175 61 176 61 176 62 175 63 175 64 175 64 175 65 176 68 177 68 178 70 179 71 179 71 179 71 179 71 179 71 177 74 177 74 174 75 173 74 172 74 170 74 168 76 168 77 166 76 166 77 164 77 163 79 162 80 160 78 159 78 158 78 157 80 155 81 154 80 154 80 153 80 153 80 151 78 150 76 149 77 144 76 142 78 142 77 140 78 136 77 137 74 136 72 135 73 134 73 134 71 134 70 133 68 136 63 136 63 137 63 138 63 139 65 141 65 143 63 145 64 144 65 146 65 148 63 147 62 148 61 147 59 147 59 147 59 147 59 148 59 150 57 150 56 150 56 155 56 157 54 159 54 159 51 159 51 159 51 159 51 161 52 161 51 162 52 162 53 164 54 163 55 165 56 166 55 168 56 167 57 167 58 168 59 170 58Z')
  static Path get kurukshetra => _$HaryanaMapSvgData_kurukshetra;

  @SvgPath('M147 59 148 61 147 62 148 63 146 65 144 65 145 64 143 63 141 62 141 61 143 62 145 62ZM184 34 184 34 182 36 182 37 182 38 183 42 182 43 182 43 182 43 181 43 181 43 181 43 182 45 182 46 183 47 182 47 182 48 180 49 180 49 180 49 180 50 179 52 181 53 181 53 181 54 179 53 177 53 176 54 176 56 178 57 177 58 176 58 175 58 175 59 175 61 170 58 168 59 167 58 167 57 168 56 166 55 165 56 163 55 164 54 162 53 162 52 161 51 161 52 159 51 159 51 159 51 159 51 159 54 157 54 155 56 150 56 150 56 150 57 148 59 147 59 147 58 145 57 146 55 147 56 148 56 147 57 147 58 148 57 148 55 146 55 146 54 144 53 145 52 145 52 145 51 144 51 144 51 144 52 142 53 141 53 142 52 142 51 144 50 144 51 146 50 146 50 147 49 150 47 150 46 152 46 154 44 154 43 152 43 153 42 152 42 152 41 152 40 152 40 152 40 154 39 154 39 154 39 154 38 154 38 156 37 157 38 156 38 157 39 159 39 161 37 161 39 163 40 163 41 164 42 164 43 165 43 165 43 167 41 165 40 165 39 165 38 165 38 165 38 165 38 165 37 165 37 164 37 165 36 165 36 165 36 166 37 166 36 167 35 168 35 169 34 170 34 172 33 172 32 174 31 173 30 174 29 174 29 176 29 177 28 177 28 178 28 179 28 179 28 179 28 179 28 180 29 180 29 183 31 184 32Z')
  static Path get ambala => _$HaryanaMapSvgData_ambala;

  @SvgPath('M165 38 165 38 164 38 165 37 163 38 164 37 165 37 165 37 165 38 165 38 165 38ZM179 28 179 28 178 28 177 28 177 28 176 29 174 29 174 29 173 30 174 31 172 32 172 33 170 34 169 34 168 35 167 35 166 36 166 37 165 36 165 35 165 35 164 34 166 33 166 31 164 29 165 29 165 29 165 28 166 26 165 26 166 26 166 24 165 24 165 23 164 23 163 22 162 22 163 19 161 21 161 20 160 20 160 19 160 19 160 19 159 18 161 16 161 15 161 15 160 14 160 13 160 13 161 10 161 9 161 7 159 7 159 6 157 4 156 2 156 2 159 7 160 3 161 3 162 4 165 2 165 3 167 4 168 6 167 8 169 8 171 9 172 9 172 11 171 12 172 12 172 14 172 14 173 14 173 15 174 15 174 14 175 15 177 14 179 16 182 19 182 21 182 22 182 25Z')
  static Path get panchkula => _$HaryanaMapSvgData_panchkula;

  @SvgPath('M184 34 185 35 185 35 186 34 188 34 189 35 189 35 189 35 190 35 192 37 194 36 195 38 196 37 197 38 197 39 197 40 201 36 201 38 198 39 200 41 203 39 204 40 204 38 205 37 207 41 207 41 208 41 209 42 209 42 210 43 210 43 209 46 209 47 206 49 206 51 202 57 201 58 199 58 199 59 199 61 197 62 197 62 198 63 198 63 196 64 193 66 191 66 189 67 189 71 187 72 186 75 184 75 183 75 183 74 182 73 182 73 182 73 180 73 180 72 179 71 179 71 179 71 178 70 177 68 176 68 175 65 175 64 175 64 175 63 176 62 176 61 175 61 175 59 175 58 176 58 177 58 178 57 176 56 176 54 177 53 179 53 181 54 181 53 181 53 179 52 180 50 180 49 180 49 180 49 182 48 182 47 183 47 182 46 182 45 181 43 181 43 181 43 182 43 182 43 182 43 183 42 182 38 182 37 182 36 184 34Z')
  static Path get yamunanagar => _$HaryanaMapSvgData_yamunanagar;

  @SvgPath('M179 71 180 72 180 73 182 73 182 73 182 73 183 74 183 75 184 75 186 75 186 75 186 75 183 77 184 80 182 82 182 85 182 86 180 88 179 88 179 89 179 89 179 89 180 90 180 91 180 92 180 92 181 93 181 94 181 94 181 94 180 95 180 97 179 97 178 98 178 101 177 101 179 104 178 105 177 106 179 109 179 109 179 109 179 109 179 110 175 113 175 113 174 112 174 111 173 112 171 112 166 109 165 109 165 111 163 109 161 109 159 107 159 107 157 111 157 111 156 110 155 111 155 111 155 110 154 110 154 111 152 109 152 109 150 110 148 109 147 110 145 110 145 110 144 111 140 111 140 110 140 110 138 107 138 107 139 107 140 105 140 103 141 101 140 100 141 100 142 98 145 99 148 95 150 95 151 96 152 93 151 93 151 89 150 88 152 85 152 83 153 80 153 80 153 80 154 80 154 80 155 81 157 80 158 78 159 78 160 78 162 80 163 79 164 77 166 77 166 76 168 77 168 76 170 74 172 74 173 74 174 75 177 74 177 74 179 71 179 71Z')
  static Path get karnal => _$HaryanaMapSvgData_karnal;

  @SvgPath('M103 103 103 104 103 104 103 104 101 108 106 110 105 112 107 113 107 114 108 114 110 113 110 113 110 113 111 113 111 115 113 115 113 115 113 115 114 116 116 114 116 114 118 115 118 115 119 116 119 118 117 120 119 122 118 124 119 127 120 128 120 129 124 130 125 132 125 136 126 137 126 137 126 137 125 139 125 139 124 141 121 141 122 145 122 145 121 145 120 146 120 146 119 146 119 145 118 144 119 143 118 142 114 142 114 143 112 142 110 143 110 144 110 144 109 143 108 143 108 143 108 141 106 141 104 140 103 141 104 146 104 146 103 145 100 144 99 147 98 146 96 149 96 150 96 150 96 151 95 152 95 152 95 152 94 152 92 151 92 151 90 153 90 153 90 153 90 153 85 152 85 152 83 150 82 150 81 147 80 147 78 147 76 148 75 148 74 148 75 148 74 145 74 145 73 145 71 145 69 145 70 143 69 141 66 141 66 137 67 137 66 136 65 135 64 135 64 135 65 135 65 133 67 133 67 132 67 130 66 129 67 127 67 127 67 126 67 126 65 127 63 129 61 128 63 124 63 123 63 123 66 122 66 120 67 120 68 118 69 118 69 119 71 119 71 118 71 118 71 117 71 117 72 117 72 116 73 116 74 116 75 118 78 119 78 119 79 120 80 120 79 119 80 118 80 115 81 114 86 113 88 114 87 115 88 116 90 115 91 113 89 110 90 108 93 107 95 107 96 106 96 104 97 104 97 105 99 105 99 104 100 104 101 102 101 102 101 102Z')
  static Path get hisar => _$HaryanaMapSvgData_hisar;

  @SvgPath('M99 188 99 188 99 190 98 191 97 191 96 191 94 190 94 190 91 190 91 190 90 189 92 188 92 186 88 185 88 184 86 184 84 182 84 181 84 181 84 180 81 180 81 175 81 175 77 174 77 173 75 171 75 166 75 165 76 164 75 164 73 162 74 158 73 157 72 153 71 151 71 151 73 150 73 150 73 150 73 150 74 148 74 148 74 148 75 148 76 148 78 147 80 147 81 147 82 150 83 150 85 152 85 152 90 153 90 153 90 153 90 153 92 151 92 151 94 152 95 152 95 152 95 152 96 151 96 150 96 150 96 149 98 146 99 147 100 144 103 145 104 146 104 146 103 141 104 140 106 141 108 141 108 143 108 143 109 143 110 144 110 144 110 143 112 142 114 143 114 142 118 142 119 143 118 144 119 145 119 146 120 146 120 146 120 147 119 149 121 150 121 152 128 153 129 155 127 160 127 160 125 160 125 162 124 162 123 165 122 165 121 166 121 168 121 168 121 170 118 169 117 170 114 169 114 169 114 171 114 172 113 172 113 170 112 169 112 171 110 170 103 175 99 175 96 176 95 176 96 178 94 179 94 181 93 182 97 184 98 182 99 182 99 182 99 183 101 183 101 184 98 184 99 186 100 186Z')
  static Path get bhiwani => _$HaryanaMapSvgData_bhiwani;

  @SvgPath('M163 160 162 159 161 160 160 160 156 165 155 163 154 164 152 164 152 165 151 165 150 165 151 163 152 163 152 162 149 161 149 160 148 158 148 158 148 158 147 158 147 158 147 159 148 160 146 161 145 161 144 164 144 164 143 165 140 164 140 165 136 165 135 165 133 166 133 168 133 168 132 169 131 168 130 168 130 167 131 166 130 165 131 162 127 160 127 160 129 155 128 153 121 152 121 150 119 149 120 147 120 146 120 146 120 146 121 145 122 145 122 145 121 141 124 141 125 139 125 139 125 139 128 139 130 141 132 140 134 141 136 139 136 139 137 139 139 140 141 138 143 141 148 141 152 144 154 145 153 148 154 149 155 148 156 149 156 150 157 151 159 151 159 153 158 156 161 156Z')
  static Path get rohtak => _$HaryanaMapSvgData_rohtak;

  @SvgPath('M167 161 166 161 165 161 164 161 164 161 163 160 161 156 158 156 159 153 159 151 157 151 156 150 156 149 155 148 154 149 153 148 154 145 152 144 148 141 143 141 141 138 139 140 137 139 137 135 139 133 138 132 136 128 140 128 140 130 142 130 143 129 142 126 142 125 144 125 145 124 148 126 148 126 150 126 150 125 151 126 152 126 152 127 156 124 157 125 157 127 158 129 163 131 165 129 170 132 173 132 174 132 175 133 176 132 177 134 180 133 180 133 180 135 181 137 181 137 180 138 180 140 182 140 182 143 183 144 184 147 184 150 184 151 186 151 186 152 186 152 186 155 184 154 183 155 185 156 185 157 182 156 181 158 181 158 181 158 180 158 180 158 180 156 179 156 176 154 176 156 175 155 173 158 171 158 170 158 170 159 170 159 170 159 169 159 169 159 169 160 168 159Z')
  static Path get sonipat => _$HaryanaMapSvgData_sonipat;

  @SvgPath('M155 111 156 110 157 111 157 111 159 107 159 107 161 109 163 109 165 111 165 109 166 109 171 112 173 112 174 111 174 112 175 113 175 113 179 110 179 109 179 109 179 109 179 109 179 111 179 112 179 112 180 113 181 113 180 113 180 116 181 117 179 118 179 119 179 119 181 120 181 121 181 121 181 123 181 123 181 123 181 123 180 125 180 126 180 126 181 128 179 129 180 131 180 133 180 133 177 134 176 132 175 133 174 132 173 132 170 132 165 129 163 131 158 129 157 127 157 125 156 124 152 127 152 126 151 126 150 125 147 123 147 123 147 123 147 122 148 120 148 118 148 118 153 117 154 115 153 115Z')
  static Path get panipat => _$HaryanaMapSvgData_panipat;

  @SvgPath('M133 168 133 168 134 168 137 169 136 172 134 172 136 174 135 176 134 176 134 176 133 179 132 179 132 176 132 176 130 175 129 174 129 174 128 177 127 177 128 178 127 183 124 183 124 184 124 185 124 185 125 185 125 185 125 186 124 188 122 188 121 186 120 185 120 185 119 187 118 187 118 188 116 188 116 186 116 186 115 187 113 187 113 187 111 191 107 191 106 188 104 187 99 188 100 186 99 186 98 184 101 184 101 183 99 183 99 182 99 182 98 182 97 184 93 182 94 181 94 179 96 178 95 176 96 176 99 175 103 175 110 170 112 171 112 169 113 170 113 172 114 172 114 171 114 169 114 169 117 170 118 169 121 170 121 168 121 168 121 166 122 165 123 165 124 162 125 162 125 160 127 160 131 162 130 165 131 166 130 167 130 168 131 168 132 169 133 168Z')
  static Path get charkiDadri => _$HaryanaMapSvgData_charkiDadri;

  @SvgPath('M163 160 164 161 164 161 165 161 166 161 167 161 168 161 168 161 168 161 168 163 167 164 168 166 167 167 169 168 168 170 168 170 168 170 167 170 166 172 167 173 167 173 167 174 167 174 167 174 166 173 165 174 164 173 162 177 160 177 161 179 163 181 163 183 163 183 163 183 159 183 158 185 157 186 156 185 155 186 154 185 151 183 152 188 152 190 153 192 152 194 150 193 150 192 149 192 149 192 148 190 146 189 146 188 144 188 142 190 142 190 142 188 139 188 135 189 134 189 134 186 132 185 130 185 129 186 126 185 125 185 125 185 124 185 124 185 124 184 124 183 127 183 128 178 127 177 128 177 129 174 129 174 130 175 132 176 132 176 132 179 133 179 134 176 134 176 135 176 136 174 134 172 136 172 137 169 134 168 133 168 133 168 133 166 135 165 136 165 140 165 140 164 143 165 144 164 144 164 145 161 146 161 148 160 147 159 147 158 147 158 148 158 148 158 148 158 149 160 149 161 152 162 152 163 151 163 150 165 151 165 152 165 152 164 154 164 155 163 156 165 160 160 161 160 162 159Z')
  static Path get jhajjar => _$HaryanaMapSvgData_jhajjar;

  @SvgPath('M98 191 99 190 99 188 99 188 104 187 106 188 107 191 111 191 113 187 113 187 115 187 116 186 116 186 116 188 118 188 118 187 119 187 120 185 120 185 121 186 122 188 124 188 124 188 124 190 125 190 125 192 126 193 127 193 129 193 129 195 129 195 129 196 129 196 129 196 128 197 128 199 128 200 128 201 128 203 127 203 126 205 126 205 125 205 126 207 125 207 124 208 124 208 125 208 125 209 126 209 129 211 127 212 126 212 125 213 125 213 125 213 129 215 128 218 126 219 125 218 125 216 122 215 121 215 121 216 117 216 118 218 120 217 118 219 117 218 116 220 116 222 118 223 116 227 119 228 118 230 119 232 119 232 120 232 120 232 120 234 118 233 117 235 115 233 114 233 114 232 113 231 111 230 111 230 111 232 110 232 110 232 109 231 109 232 105 232 104 231 104 229 104 228 105 227 101 226 101 225 101 225 102 224 104 225 104 223 105 222 103 221 103 220 105 220 105 220 104 219 104 218 105 217 105 217 106 218 107 216 106 216 107 216 108 215 107 214 106 216 104 217 104 216 105 215 104 214 101 214 102 212 104 211 105 211 106 209 107 209 107 208 110 208 110 210 111 210 112 210 111 209 111 208 110 206 109 205 109 204 106 202 107 200 105 198 104 196 103 197 102 195 101 195 100 192 99 192 99 191Z')
  static Path get mahendragarh => _$HaryanaMapSvgData_mahendragarh;

  @SvgPath('M125 185 125 185 126 185 129 186 130 185 132 185 134 186 134 189 135 189 139 188 142 188 142 190 142 190 144 188 146 188 146 189 148 190 149 192 149 192 149 192 149 193 148 197 149 198 149 197 150 197 150 200 152 200 155 202 156 203 158 201 158 201 159 202 161 202 161 203 162 203 162 203 161 203 161 204 161 204 160 205 158 204 159 206 157 206 158 208 157 209 155 209 154 211 152 211 150 214 148 213 148 217 149 219 144 220 143 222 141 223 141 222 141 222 141 218 140 217 139 218 138 217 135 217 136 216 137 216 138 216 135 213 136 212 138 213 138 211 137 211 138 210 137 210 137 210 136 210 136 209 136 209 135 209 133 209 132 209 131 210 130 210 129 209 129 208 128 207 127 207 126 207 125 205 126 205 126 205 127 203 128 203 128 201 128 200 128 199 128 197 129 196 129 196 129 196 129 195 129 195 129 193 127 193 126 193 125 192 125 190 124 190 124 188 124 188 125 186 125 185Z')
  static Path get rewari => _$HaryanaMapSvgData_rewari;

  @SvgPath('M149 192 150 192 150 193 152 194 153 192 152 190 152 188 151 183 154 185 155 186 156 185 157 186 158 185 159 183 163 183 163 183 165 182 168 183 169 181 171 182 172 181 171 181 171 180 171 180 174 182 176 182 177 182 177 182 179 183 179 184 178 185 179 187 182 188 182 188 182 190 182 190 181 191 181 191 181 196 184 198 185 199 186 199 185 200 185 201 184 202 183 203 184 204 183 205 182 205 180 203 180 203 179 204 178 203 177 204 176 203 176 204 175 204 174 202 172 202 172 197 171 196 169 195 168 197 166 196 165 198 165 198 165 198 165 199 165 200 165 201 164 201 163 201 162 203 161 203 161 202 159 202 158 201 158 201 156 203 155 202 152 200 150 200 150 197 149 197 149 198 148 197 149 193 149 192Z')
  static Path get gurugram => _$HaryanaMapSvgData_gurugram;

  @SvgPath('M162 203 163 201 164 201 165 201 165 200 165 199 165 198 165 198 165 198 166 196 168 197 169 195 171 196 172 197 172 202 174 202 175 204 176 204 176 203 177 204 178 203 179 204 180 203 180 203 182 205 183 205 183 205 183 205 184 205 183 206 182 206 182 208 179 211 180 213 180 215 181 216 180 217 181 218 180 220 181 220 180 223 181 224 183 224 183 224 184 225 186 228 188 229 189 230 190 228 191 229 193 231 193 231 193 232 193 232 190 233 189 235 188 234 187 236 187 236 186 235 185 235 184 233 184 233 183 234 184 235 182 236 182 235 183 234 181 234 181 234 181 234 181 236 180 237 179 235 178 236 176 234 174 233 173 236 174 237 175 238 176 237 176 239 175 240 173 239 172 239 172 240 171 240 169 246 169 245 167 244 167 244 166 245 165 246 164 244 165 243 164 242 164 242 166 242 164 241 164 240 166 235 165 234 165 232 167 233 167 232 167 228 168 228 168 226 166 226 167 221 166 221 169 210 167 209 168 209 166 209 164 206 165 205 163 205 163 204 161 204 161 203 162 203Z')
  static Path get nuh => _$HaryanaMapSvgData_nuh;

  @SvgPath('M183 205 184 204 183 203 184 202 185 201 185 200 186 200 186 200 186 200 188 201 188 200 188 200 191 201 192 201 192 201 193 203 195 203 196 204 198 204 198 205 199 204 201 205 202 204 204 205 204 205 204 205 203 205 203 206 204 206 204 206 206 206 207 206 207 206 206 207 206 208 204 208 204 209 203 210 204 211 203 213 202 212 202 212 202 213 202 214 202 214 202 214 202 214 202 214 204 216 202 217 204 218 204 218 206 221 205 222 205 222 205 223 206 223 206 223 206 225 205 225 205 225 204 226 203 225 202 225 202 228 201 229 201 229 201 229 199 228 198 228 198 228 198 229 198 231 198 231 195 231 194 231 193 231 193 231 191 229 190 228 189 230 188 229 186 228 184 225 183 224 183 224 181 224 180 223 181 220 180 220 181 218 180 217 181 216 180 215 180 213 179 211 182 208 182 206 183 206 184 205 183 205 183 205Z')
  static Path get palwal => _$HaryanaMapSvgData_palwal;

  @SvgPath('M185 200 186 199 185 199 184 198 181 196 181 191 181 191 182 190 182 190 182 190 183 190 184 190 185 189 186 189 187 188 187 187 187 186 186 186 187 185 187 184 187 184 190 183 191 184 193 183 194 181 194 183 194 183 194 183 195 183 196 185 198 185 197 186 199 186 199 188 201 189 201 189 202 189 202 190 202 191 204 193 203 194 202 195 204 197 204 199 203 200 203 201 207 202 205 203 206 204 205 205 204 205 204 205 204 205 204 205 202 204 201 205 199 204 198 205 198 204 196 204 195 203 193 203 192 201 192 201 191 201 188 200 188 200 188 201 186 200 186 200 186 200Z')
  static Path get faridabad  => _$HaryanaMapSvgData_faridabad;


}