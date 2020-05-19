///
/// Created by Giovanni Terlingen
/// See lICENSE file for more information.
///
import 'dart:ui';

import 'package:built_path_annotations/built_path_annotations.dart';
part 'puducherrymap_svg_data.svg_path.g.dart';


/// We can open our exported SVG image, then we put all SVG data we have in the
/// property it belongs to. Our build runner will create Paths for us to use
/// within the app. Run command: flutter packages pub run build_runner build
class PuducherryMapSvgData {

  @SvgPath(
      'M221 66 221 66 221 66 219 66 218 67 218 67 219 69 219 71 219 72 218 73 218 74 219 74 219 75 219 76 218 76 218 76 217 78 216 77 216 79 216 79 217 79 217 79 217 79 216 79 215 79 215 79 212 75 211 74 210 75 209 75 208 75 207 74 206 74 205 73 205 73 205 73 204 73 202 73 202 73 202 73 202 72 203 69 203 69 203 69 202 68 203 67 203 66 204 65 203 65 203 65 203 64 204 63 206 63 206 63 206 62 206 60 206 59 206 59 206 57 206 55 207 53 208 53 208 52 209 52 210 52 210 51 211 52 212 52 213 46 215 47 216 46 216 46 217 46 217 46 220 47M235 68 235 68 235 69 235 69 234 69 233 69 233 68 231 68 231 67 231 67 231 67 230 67 230 69 230 68 228 68 228 67 227 67 227 67 225 66 225 66 224 66 225 65 226 66 225 65 224 65 223 64 222 64 222 65 221 66 221 65 221 65 220 64 220 63 219 62 219 62 219 61 219 61 219 59 220 57 219 57 219 57 221 55 221 54 221 54 221 53 219 51 221 50 220 47 220 45 219 45 220 45 221 44 220 42 220 42 221 43 222 43 223 41 224 41 224 40 224 40 224 41 224 41 225 41 225 42 225 42 225 42 226 41 227 42 229 42 228 42 229 42 229 43 230 43 229 44 230 44 232 44 232 49 233 51 233 52 240 57 240 60 237 63 237 64 236 64 236 64 237 65 236 66 236 67 236 67 235 67 235 66 235 66 235 66 234 67 234 68 235 68 235 68 236 69 236 68 237 68 237 69 238 69 237 71 238 72 238 73 238 74 236 74 238 74 238 75 237 76 237 76 237 76 237 76 235 77 234 77 234 76 234 76 233 76 233 75 232 75 232 76 233 76 234 77 233 77 233 79 233 79 233 80 234 79 234 80 234 79 234 80 234 81 233 81 233 83 233 84 234 83 234 83 234 83 233 84 233 84 233 84 233 85 232 87 232 88 232 88 230 89 230 89 229 90 227 91 227 92 226 91 224 91 224 88 224 85 223 79 224 79 223 78 223 78 222 79 220 78 217 79M226 91 226 91 226 91 227 92 226 93 228 93 228 93 229 94 229 96 228 96 228 95 228 95 227 95 226 95 224 95 225 96 224 97 224 97 224 98 223 99 222 98 222 97 221 97 221 98 220 98 221 99 220 99 220 99 220 99 220 100 221 100 221 101 220 102 218 102 219 103 219 103 218 103 218 103 215 102 214 103 213 102 213 102 213 102 214 101 214 101 212 101 210 100 210 100 210 101 209 101 209 101 209 101 209 101 205 101 204 99 204 97 203 98 202 96 200 96 199 97 199 97 199 97 198 97 198 97 198 97 197 96 197 96 197 95 198 95 198 94 199 94 198 93 198 93 200 93 201 93 202 93 201 92 202 91 201 90 200 88 198 88 198 86 197 86 197 85 196 85 197 83 195 83 195 82 195 82 195 82 195 82 196 81 195 81 196 79 196 79 196 77 196 77 196 75 197 73 197 72 197 72 198 72 198 73 199 73 199 74 200 73 201 74 202 74 202 74 202 73M177 85 177 85 177 86 177 86 177 86 177 87 177 87 177 88 178 89 179 89 179 91 179 92 179 92 178 95 179 95 179 95 180 95 181 96 181 96 181 96 181 96 180 99 180 100 178 100 178 100 177 101 177 101 177 101 178 101 178 101 178 101 178 101 178 101 176 101 175 101 175 101 173 100 173 100 173 100 173 100 173 100 172 100 171 101 171 101 172 102 172 102 171 103 170 106 167 105 163 106 163 107 163 107 163 107 163 107 162 108 162 108 162 108 161 108 160 106 157 107 156 107 156 107 156 107 155 106 155 105 155 106 154 105 154 105 154 105 154 104 154 103 153 103 153 102 153 102 152 102 152 102 151 102 152 101 152 100 151 100 151 99 150 100 149 99 149 99 148 98 148 98 148 98 146 98 145 98 145 97 144 96 144 94 149 93 149 92 150 93 151 92 152 93 151 91 151 91 150 91 151 90 151 90 152 89 152 89 152 87 151 87 151 87 151 83 151 83 150 82 151 81 152 78 149 77 149 77 149 76 149 75 149 74 148 75 148 74 148 74 148 73 148 73 148 73 149 72 149 72 150 72 151 72 150 69 151 68 153 69 153 68 153 67 153 67 155 68 155 68 156 69 157 68 160 66 160 66 160 67 159 68 160 68 160 68 160 68 161 68 162 68 163 70 163 71 162 73 163 75 165 76 166 75 166 74 168 76 171 75 170 77 170 77 170 78 170 79 169 81 170 81 170 82 171 82 172 82 173 83 173 83 174 83 174 83 175 85 176 85 177 85 177 85 177 85 177 85 177 83 177 83 178 83 178 82 178 83 178 82 178 81 178 81 179 80 178 79 180 77 181 78 181 76 182 76 183 74 183 74 183 74 183 75 184 75 185 76 185 76 185 76 188 76 189 75 189 74 190 74 192 75 191 76 193 76 193 76 194 77 195 76 196 77M198 97 198 97 199 97 198 98 198 98 199 99 199 100 198 100 198 101 195 99 193 100 192 100 192 99 191 99 191 100 190 99 189 99 190 98 190 98 187 97 187 96 188 96 188 95 187 95 186 96 182 96 181 96M74 112 74 112 74 112 73 114 73 114 73 114 72 115 72 115 72 115 74 116 76 117 76 117 75 118 74 119 70 120 71 122 65 121 65 121 65 121 64 120 64 120 63 119 63 118 62 117 63 115 62 113 61 113 61 111 59 110 59 109 55 109 56 108 54 107 54 105 53 103 53 102 53 101 50 100 49 98 48 99 47 98 45 98 45 98 45 98 46 97 47 93 47 92 48 90 48 89 47 89 47 88 48 87 49 87 49 87 50 86 49 84 48 84 48 82 48 82 47 82 48 79 52 78 52 78 52 78 52 78 56 79 60 79 61 79 65 78 65 78 65 78 67 78 68 78 68 78 68 78 71 77 71 77 73 73 74 73 74 73 75 74 75 75 76 75 76 76 76 76 76 77 77 78 77 79 78 80 78 80 79 80 79 79 79 78 79 78 80 78 80 79 81 79 81 78 80 77 81 77 81 77 81 77 82 77 82 78 82 78 82 77 83 77 83 78 84 78 85 77 85 77 86 77 87 80 86 80 85 81 86 81 86 82 87 82 87 83 87 83 87 83 88 84 88 84 89 85 90 84 90 85 90 85 90 86 91 86 91 87 93 87 93 88 94 88 94 87 94 88 94 89 94 89 94 89 94 90 92 90 92 91 93 92 93 93 94 93 96 93 96 94 96 95 98 96 97 97 97 98 97 99 98 99 97 100 97 100 97 100 97 101 97 102 98 103 98 103 98 103 98 103 97 104 97 106 97 106 96 105 95 106 95 107 94 107 94 107 93 106 93 106 93 104 92 104 92 104 91 105 90 105 88 105 87 107 86 106 84 107 83 108 83 107 84 106 84 106 82 107 81 105 79 105 79 106 79 107 76 109 75 110 76 111 76 111 75 111 75 112 75 112 74 111 74 112 74 112 73 112 73 112 73 112 73 111 72 109 71 108 71 106 70 105 69 103 68 103 68 105 66 105 66 104 66 104 66 104 67 103 66 102 67 101 67 101 68 99 69 98 70 98 71 98 71 97 73 98 73 98 72 95 70 95 68 93 66 89 66 89 66 88 66 88 66 87 65 86 65 86 66 85 67 84 67 80 68 78M94 89 94 89 94 89 94 89 96 87 96 86 95 85 95 85 97 85 97 85 97 84 97 84 98 83 98 84 100 84 101 84 102 81 104 81 105 79 106 79 107 78 109 79 108 81 109 81 109 82 109 81 110 81 110 81 111 81 110 83 111 84 111 85 113 85 113 85 114 85 114 85 114 85 117 83 118 84 119 82 119 84 118 85 119 85 119 85 119 85 119 86 120 87 121 87 121 86 123 87 124 87 124 87 124 87 125 87 127 87 128 87 128 87 129 88 130 88 130 88 131 88 131 88 131 88 131 88 131 88 131 88 130 89 130 88 129 88 129 89 129 89 129 91 129 91 128 92 128 93 127 92 122 92 122 93 121 93 122 94 121 95 122 95 123 97 122 97 123 97 122 98 125 99 126 99 126 101 126 102 126 102 125 102 125 102 125 102 125 103 124 103 124 103 124 103 124 103 124 104 124 104 124 104 122 105 121 104 119 104 119 104 118 104 119 103 118 103 117 102 116 103 117 104 118 104 117 105 117 106 117 106 116 108 116 108 116 108 117 108 117 108 117 109 118 110 117 110 117 111 117 114 118 115 117 115 118 116 118 116 117 116 117 116 117 117 116 116 115 117 115 116 114 116 114 115 114 116 113 115 113 115 112 113 111 113 111 112 112 111 113 111 113 111 113 111 113 110 112 109 113 108 113 107 112 106 112 105 113 105 112 105 112 105 112 105 112 105 111 105 109 104 109 104 108 104 108 103 107 104 105 104 106 103 105 103 106 102 105 100 105 100 103 101 103 101 102 101 101 102 101 102 100 103 98 103M209 101 210 102 211 102 211 104 211 104 212 104 212 106 212 107 211 108 210 107 210 107 210 107 210 108 210 110 210 110 209 110 209 109 208 109 208 110 208 109 207 109 206 109 205 108 205 109 207 110 206 112 205 111 204 112 204 111 204 111 204 111 203 111 203 111 203 111 203 111 203 111 199 109 198 108 198 109 197 110 196 108 195 109 195 110 195 111 194 109 192 111 192 111 192 111 192 111 191 110 191 110 190 109 190 109 190 109 189 109 188 109 188 107 185 106 182 103 179 103 177 102 178 101M191 110 191 110 192 111 192 111 192 111 191 112 192 113 192 113 192 113 192 114 192 114 192 114 191 116 191 116 189 117 189 116 188 116 187 116 183 117 182 119 180 119 178 119 178 119 178 119 176 118 174 118 174 118 173 116 172 116 172 116 170 115 168 116 166 115 165 115 165 115 165 114 164 112 164 110 163 110 163 109 163 109 162 108 162 108 162 108 162 108 162 108M114 116 114 116 113 116 112 118 112 119 113 119 113 120 113 123 112 123 112 124 111 122 111 123 110 123 110 123 109 124 108 123 108 123 108 122 107 122 107 122 107 122 106 123 106 123 106 123 106 123 106 122 106 122 105 121 105 120 104 119 104 119 104 120 102 121 102 120 101 120 100 118 99 118 98 118 98 118 98 120 97 120 96 118 94 117 93 118 93 120 90 119 90 121 90 121 90 121 88 120 88 121 88 122 87 122 87 124 87 126 86 126 87 126 85 126 85 127 85 127 84 128 84 128 84 131 83 132 82 133 81 133 78 132 77 133 76 133 76 133 75 132 75 131 75 131 74 131 73 132 72 132 72 131 72 129 72 127 74 125 74 123 74 121 74 120 74 119 74 119M178 119 178 119 177 119 176 120 176 120 176 120 176 121 175 121 175 122 174 122 174 123 173 124 173 125 173 126 173 126 173 127 173 127 172 128 172 128 170 128 171 129 170 129 170 129 170 129 169 129 168 129 168 129 168 129 167 129 168 127 167 127 167 128 165 127 164 127 164 125 164 125 164 123 163 123 163 122 161 122 161 122 161 122 161 122 159 121 158 123 159 123 159 126 160 126 160 126 155 127 153 126 153 126 153 126 151 125 150 124 151 124 150 123 151 122 150 122 149 120 149 120 149 119 148 118 147 117 147 118 146 118 145 119 145 119 144 119 143 120 141 119 141 116 141 116 141 115 141 113 143 112 143 111 142 111 142 111 141 112 140 109 141 108 141 107 141 107 143 105 142 104 143 104 143 105 143 104 143 104 143 104 144 103 144 103 144 103 145 103 145 103 145 103 144 104 144 104 145 106 145 106 146 105 147 105 147 106 149 107 149 109 150 110 150 110 152 109 153 107 153 104 154 105 154 105 154 105M153 126 152 127 151 129 151 129 151 129 151 129 150 128 150 128 149 128 149 128 149 128 148 127 147 127 147 127 146 127 146 128 146 128 145 128 143 127 143 127 141 126 141 126 139 124 138 123 138 123 138 124 137 123 138 123 137 122 137 122 137 123 137 123 136 123 136 123 136 123 136 123 135 122 135 123 134 123 133 123 132 123 132 123 132 123 131 123 129 123 127 122 126 121 125 120 124 120 124 119 125 118 125 118 125 117 125 117 125 117 125 116 126 116 126 116 126 116 128 117 129 116 130 117 132 118 132 118 134 118 133 117 133 116 134 116 134 115 134 115 135 113 133 113 133 112 136 110 136 110 137 110 137 109 139 109 139 108 139 107 140 106 141 105 141 104 142 104M118 116 118 116 118 116 118 116 118 116 118 116 118 117 118 117 119 118 120 118 122 117 122 118 123 116 125 116 125 117 125 117 125 117M151 129 153 129 153 130 153 130 152 131 152 131 153 132 152 133 152 133 151 134 150 136 151 137 151 138 151 138 151 138 152 138 152 139 152 139 153 139 152 141 152 141 153 141 153 141 152 141 152 141 152 142 152 142 151 142 150 144 149 145 149 145 149 145 150 147 150 148 151 149 151 151 152 151 152 152 151 153 152 154 151 153 151 153 149 153 146 151 143 151 143 152 141 152 141 152 141 151 140 153 140 153 138 152 139 151 140 151 140 150 141 150 140 148 142 149 143 148 142 148 142 147 142 147 141 146 142 146 142 145 140 145 141 145 141 143 136 143 135 141 135 140 133 140 132 139 130 140 130 139 130 140 129 141 128 141 129 140 127 139 125 139 125 139 125 138 125 138 125 136 123 136 122 135 121 137 119 137 117 139 117 140 117 140 118 141 118 141 118 141 117 142 118 143 118 143 116 143 117 144 115 145 115 146 115 147 114 147 114 147 114 147 114 147 114 147 114 148 114 148 114 148 113 148 113 148 113 148 113 147 113 147 112 147 112 147 112 147 111 146 110 145 110 144 111 144 111 143 111 143 111 142 111 141 112 141 112 140 112 139 113 139 113 138 113 138 113 138 112 137 111 136 111 135 112 134 112 134 112 134 112 134 111 133 111 133 111 132 111 132 111 131 111 131 111 131 110 130 111 130 111 130 111 129 113 126 113 126 113 125 112 124 111 124 111 124 111 124 112 124 111 123 110 123M111 133 111 133 110 134 109 134 109 135 107 136 106 135 107 134 106 134 105 134 104 133 103 134 102 134 101 134 100 134 99 134 98 134 97 133 96 133 95 131 94 131 94 132 93 132 93 132 93 131 93 130 93 130 93 130 93 130 92 130 91 128 93 126 93 124 93 122 93 122 92 122 92 122 92 121 92 121 90 121M113 148 113 148 113 150 114 150 115 150 115 150 116 151 116 151 116 152 116 152 116 152 116 152 115 152 115 152 115 152 115 153 115 153 115 154 115 155 115 156 116 157 116 157 115 157 114 158 114 158 114 159 112 158 112 159 110 160 109 159 109 159 109 161 108 161 108 160 108 161 107 162 106 161 107 159 107 159 106 159 106 159 106 158 106 158 104 157 103 158 104 159 104 159 103 159 102 160 101 161 101 160 100 161 99 160 98 161 98 161 97 161 97 160 96 159 95 160 95 160 95 160 95 160 95 159 95 159 96 159 96 159 97 158 94 158 94 156 93 156 92 156 92 157 91 157 92 158 91 159 90 159 89 160 88 159 88 160 88 160 87 159 86 159 85 159 86 158 86 157 87 155 87 155 89 155 89 155 89 154 89 154 89 153 89 153 90 152 89 150 89 149 87 149 85 150 85 149 84 150 83 149 82 149 82 148 82 147 81 147 81 148 81 149 80 150 78 147 79 145 77 143 76 143 75 142 75 141 75 141 76 139 75 137 76 135 76 135 76 133 76 133 76 133M140 153 141 153 140 155 139 155 139 155 139 154 138 154 137 156 137 157 137 157 136 157 134 157 134 156 134 157 134 156 133 156 132 155 132 156 132 154 131 155 130 154 129 154 128 154 127 154 126 156 125 156 124 157 123 157 123 156 122 156 122 156 121 160 122 160 121 160 121 161 120 162 120 164 118 166 119 167 119 168 118 168 119 168 118 166 118 166 118 166 117 165 118 164 118 164 118 163 117 163 117 162 118 160 118 160 117 160 116 159 116 158 116 158 115 158 114 158M153 141 154 142 154 142 154 142 156 141 156 141 159 142 160 143 160 144 162 144 164 145 163 146 164 147 164 147 165 148 166 148 166 148 166 148 167 149 167 149 168 149 168 149 168 150 168 150 166 150 165 151 166 151 165 152 166 153 167 153 166 155 166 157 164 156 164 157 164 157 164 157 164 157 165 158 165 158 165 158 164 160 164 163 164 164 164 165 160 169 160 168 159 168 158 169 159 170 159 170 157 171 156 172 154 171 153 170 153 169 152 168 153 168 154 166 153 166 152 166 152 165 152 165 152 165 152 164 152 163 152 162 152 161 151 161 151 161 151 161 151 162 150 161 149 161 149 161 149 161 149 162 148 162 147 162 146 163 145 162 144 161 144 160 145 160 146 160 145 158 145 157 143 155 141 155 141 156 139 156 139 156 138 157 138 157 137 157M168 149 169 148 170 148 171 149 173 148 174 149 175 148 176 149 179 149 179 149 179 150 179 150 180 149 180 150 180 150 180 151 179 151 178 151 178 151 176 152 177 153 177 153 177 154 176 155 176 155 176 156 175 158 177 159 179 162 179 161 179 161 180 161 181 162 181 162 181 161 184 164 184 164 184 164 184 164 184 166 185 167 185 168 187 167 189 168 189 168 190 168 190 168 190 169 190 169 190 169 191 169 191 169 191 169 191 172 191 172 191 172 191 172 189 172 189 173 190 174 190 175 192 175 193 176 193 179 195 180 195 182 195 182 192 182 192 182 192 182 191 183 191 182 191 182 191 183 192 183 191 184 190 184 190 183 191 184 190 183 190 184 189 184 188 184 188 184 188 184 188 184 188 184 186 184 186 183 186 183 186 183 185 183 185 183 185 182 185 182 185 182 183 181 183 181 182 180 182 180 181 180 180 180 180 180 180 179 179 179 178 178 178 178 178 178 177 179 176 179 176 179 176 180 176 180 176 180 173 178 171 176 169 174 169 174 167 173 166 172 162 172 162 172 160 169 160 169 160 169M156 172 156 173 156 173 156 173 156 173 156 173 157 174 157 174 157 174 158 175 159 176 158 177 157 178 159 179 158 180 159 180 158 180 157 182 157 182 156 183 159 185 157 188 158 189 155 193 155 193 154 194 154 195 153 195 150 195 150 195 148 195 148 194 147 193 148 193 148 191 149 190 150 191 151 190 150 190 150 190 150 189 149 189 149 189 147 191 144 191 144 191 144 191 143 190 143 190 141 190 139 190 138 190 137 189 137 189 136 188 133 187 132 187 131 187 131 187 131 187 131 187 131 188 129 188 129 188 129 188 128 189 127 190 127 190 127 190 125 193 125 193 124 192 123 191 123 191 123 191 122 191 123 191 122 191 122 190 122 190 120 191 119 189 118 189 117 189 117 189 116 189 115 190 115 190 115 190 117 188 117 187 118 186 117 185 119 182 118 181 120 181 120 180 119 180 119 178 119 178 119 176 118 174 119 173 119 172 119 172 118 172 118 172 118 172 119 171 119 170 118 170 118 169 118 169 118 168 118 168M118 172 117 172 117 172 117 172 114 174 113 173 112 174 112 174 112 175 111 175 111 175 110 174 108 174 108 174 107 173 105 174 105 175 101 175 100 174 96 175 93 175 93 176 94 176 91 177 91 178 85 178 84 177 82 177 80 175 79 175 79 172 78 172 76 170 74 170 74 170 74 168 74 167 75 167 77 165 80 165 82 164 82 164 83 162 83 160 84 159 85 159 85 159 85 159 86 159M151 90 150 89 150 90 150 89 147 88 147 89 146 89 145 89 144 88 143 88 143 88 142 88 142 87 141 87 141 87 140 87 140 86 139 87 138 86 137 88 135 87 135 87 134 87 134 87 133 86 132 86 132 86 133 84 133 84 133 83 134 83 133 82 132 82 132 80 131 81 131 81 130 81 129 80 129 79 132 78 132 77 131 77 131 77 134 78 136 77 136 77 137 78 137 78 138 78 138 76 139 77 139 76 139 75 140 75 141 76 143 76 143 76 144 76 144 75 144 74 143 72 143 71 144 70 145 69 145 66 146 66 146 65 148 66 149 66 150 65 152 65 153 66 153 66 153 67M119 85 119 85 119 85 121 84 123 83 123 83 122 82 122 81 125 81 126 80 127 80 127 78 130 78 129 79')
  static Path get puducherryBoundary => _$PuducherryMapSvgData_puducherryBoundary;
  
}
