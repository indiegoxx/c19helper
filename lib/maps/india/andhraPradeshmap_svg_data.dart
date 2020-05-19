///
/// Created by Giovanni Terlingen
/// See lICENSE file for more information.
///
import 'dart:ui';

import 'package:built_path_annotations/built_path_annotations.dart';
part 'andhraPradeshmap_svg_data.svg_path.g.dart';


/// We can open our exported SVG image, then we put all SVG data we have in the
/// property it belongs to. Our build runner will create Paths for us to use
/// within the app. Run command: flutter packages pub run build_runner build
class AndhraPradeshMapSvgData {

  @SvgPath(
      'M190 40 190 40 190 41 189 41 189 42M186 58 185 58 185 59 185 59 185 60 185 60 185 61M186 61 185 61 185 61 185 60 185 59 185 58 186 58 186 58 186 58 187 56 188 56 186 55 185 55 185 55 185 55 185 55 184 54 185 53 185 53 184 52 184 52 184 52 184 51 184 51 185 51 184 50 184 50 185 50 185 48 184 48 184 48 183 49 183 49 183 48 183 48 184 47 183 47 183 46 184 45 183 45 183 44 184 43 184 43 184 43 185 43 185 42 186 42 186 42 187 41 188 42 189 42 189 41 189 41 190 40 190 40 190 40 189 39 189 38 189 38 189 38 190 38 189 37 189 37 189 36 189 35 189 35 190 35 191 37 191 38 191 38 191 39 192 41 193 41 194 41 194 41 195 41 196 41 198 43 199 42 199 42 199 42 200 42 200 42 201 42 201 42 201 41 202 42 203 42 203 41 204 42 204 41 205 41 204 41 205 41 205 40 204 40 204 39 204 39 205 40 205 40 206 39 205 39 206 39 206 39 206 38 207 39 207 38 207 38 207 38 207 37 207 37 208 36 207 36 207 35 208 36 208 35 209 34 210 34 211 34 211 34 211 35 212 35 212 34 213 34 213 34 213 33 212 33 212 33 212 33 211 32 213 32 213 31 214 31 215 31 215 32 214 32 214 32 216 34 214 37 214 37 212 39 210 41 210 42 209 43 208 44 207 45 205 47 205 48 199 54 199 54 199 55 194 58 189 61 186 62 186 61 186 62 184 64 183 66 181 66 181 65 181 65 181 66 180 66 181 66 180 66 179 65 180 64 180 64 179 64 179 63 179 63 178 62 178 63 177 63 177 63 177 63 177 64 176 64 176 64 176 64 175 66 174 66 175 66 175 66 175 67 175 67 175 68 174 68 174 69 172 69 172 68 172 68 172 67 171 66 171 66 170 66 170 65 169 65 169 64 169 63 169 63 169 62 170 62 170 62 172 61 172 61 171 61 172 61 171 60 172 60 171 60 172 59 171 59 172 59 173 59 172 59 173 58 173 58 174 59 174 59 174 58 175 58 175 58 175 57 176 58 175 56 175 56 174 56 174 55 173 55 173 55 172 55 172 54 172 54 171 54 171 54 171 54 171 54 170 54 171 52 171 53 170 53 170 52 170 52 170 52 169 52 169 52 169 51 170 50 171 49 171 48 170 49 170 49 169 48 170 47 170 47 169 47 169 47 169 47 168 47 168 47 169 46 169 46 170 45 170 44 172 43 171 42 172 42 173 42 173 42 174 43 174 43 174 43 174 42 176 42 176 41 177 41 177 41 177 41 178 40 179 41 179 40 180 39 179 39 179 38 178 38 178 38 178 37 178 37 178 37 178 37 178 38 177 38 177 37 177 37 177 37 177 36 177 36 177 36 178 35 178 35 178 36 179 35 180 36 180 36 180 36 180 37 181 37 181 36 181 36 180 35 181 35 181 35 181 34 181 33 181 33 181 33 181 33 181 33 182 34 182 34 182 35 182 35 182 35 182 35 183 35 183 35 183 34 183 33 184 33 184 34 184 34 184 33 185 33 185 32 185 32 185 31 186 31 186 32 186 32 186 32 186 33 186 33 187 34 187 35 188 35 188 36 188 36 189 38M181 65 181 65 181 66 182 65 183 66 181 67 180 68 180 68 180 70 178 71 178 72 177 73 177 73 177 73 176 73 176 73 175 75 175 75 174 76 173 77 169 78 168 79 160 83 156 85 155 84 156 84 156 83 156 83 157 83 156 82 158 79 157 79 156 78 156 78 155 78 155 78 154 77 154 78 154 78 154 79 152 79 151 79 152 78 151 79 150 78 151 78 150 77 151 76 150 76 149 75 149 75 148 75 147 74 146 75 146 75 145 74 144 74 143 75 143 74 142 75 142 75 141 74 142 74 142 74 142 74 142 72 142 72 142 71 141 71 140 71 141 71 140 72 138 72 138 71 139 70 139 70 140 69 141 68 142 69 142 69 142 69 141 67 142 66 142 65 142 65 141 64 142 63 142 63 142 62 142 63 143 63 143 62 144 62 145 62 145 63 146 63 146 63 146 64 147 64 148 64 149 64 149 64 148 63 149 63 150 62 149 63 150 63 150 62 150 63 151 63 151 62 150 61 151 60 151 60 151 60 151 59 150 59 150 58 150 58 150 58 150 57 151 56 152 56 152 56 152 55 151 55 150 55 152 54 152 53 151 52 153 50 153 50 155 49 155 49 155 50 156 50 156 50 156 51 155 51 156 52 156 51 157 51 156 53 157 53 158 54 158 54 158 54 158 55 157 55 157 55 158 56 157 56 159 57 159 57 159 57 159 56 159 56 159 56 162 54 163 54 162 53 163 53 163 53 163 53 162 52 163 51 164 52 164 52 166 52 166 53 167 54 168 54 168 53 169 53 170 53 171 52 171 52 170 54 171 54 171 54M173 55 174 55 174 55 174 56 175 56 176 58M175 58 174 58 174 58 174 59 174 59 174 59 173 58M112 129 112 129 113 129 112 129M109 128 109 128 109 128 109 128M109 128 109 128 109 128 109 128M109 127 109 127 109 127 109 127M109 127 109 127 109 127 109 127M115 127 115 126 115 126 115 127M115 126 115 126 115 126 115 126M109 125 109 125 109 125 109 125M109 125 109 125 109 125 109 125M109 125 109 125 109 125 109 125M108 124 109 125 108 124 108 124M110 129 109 129 109 127 109 127 109 128 110 129 108 125 109 126 109 126 109 126 109 125 108 124 106 124 102 125 99 126 99 126 100 126 100 125 100 125 100 125 99 124 98 125 98 124 98 121 99 122 99 121 97 120 97 120 96 120 96 120 96 119 96 119 95 119 94 119 94 119 94 120 93 120 92 120 92 119 91 119 91 120 90 120 90 119 89 119 89 118 89 118 89 118 89 117 88 117 87 117 87 117 86 116 86 117 86 117 84 116 84 117 84 117 84 118 85 119 85 119 84 120 84 121 84 121 85 121 85 121 85 122 85 122 84 122 84 123 82 122 82 123 81 123 81 125 81 125 81 126 80 125 80 125 79 124 79 123 78 123 78 123 77 123 77 123 76 122 76 122 76 120 75 119 75 118 75 117 75 116 76 115 76 113 75 112 74 112 73 112 70 114 68 115 66 116 66 114 67 111 66 111 66 110 66 108 67 108 66 107 66 106 67 106 67 105 68 105 70 104 72 104 73 103 73 103 74 103 75 103 77 102 78 102 79 101 80 101 81 100 81 100 82 100 83 101 83 101 84 101 85 103 86 103 87 102 87 101 88 101 89 100 89 98 90 98 91 98 91 100 91 102 94 103 96 103 97 104 100 104 102 105 102 106 105 107 106 109M108 111 109 113 109 114 109 114M111 119 111 119 112 123M139 70 138 71 138 72M143 75 144 74 145 74M146 75 147 75 148 74 148 75M150 76 151 76 150 77 151 78M152 79 153 79 154 79 154 78 154 78 154 77M157 79 158 80 157 81 156 82M156 85 153 88 150 91 149 92 149 94 149 94 148 94 148 96 148 96 149 96 149 96 149 96 149 96 149 96 150 96 150 97 150 96 151 97 151 96 151 97 151 94 150 93 151 93 151 94 151 96 151 100 151 100 151 101 150 102 150 103 150 105 148 105 140 110 137 110 134 112 134 112 134 111 133 109 134 108 134 109 135 109 136 107 137 107 138 104 137 102 136 101 136 100 135 99 135 98 135 97 134 95 134 94 135 93 134 92 134 91 133 90 132 87 132 85 133 84 133 84 131 83 131 82 131 81 130 81 130 80 129 80 128 79 126 79 125 79 124 78 123 79 122 78 122 78 121 77 118 76 118 75 115 76 115 75 115 74 114 74 114 74 113 75 112 74 112 74 112 74 112 73 111 73 112 73 111 72 114 70 114 71 116 71 116 72 117 71 117 70 117 70 119 68 122 70 124 69 125 70 125 69 126 69 126 69 126 69 127 69 128 69 130 69 130 69 131 69 132 69 132 68 133 67 133 67 134 68 136 66 136 65 139 65 139 64 140 64 141 64 141 64 141 64 142 65 142 65M148 99 147 100 146 100 147 100 148 100 149 101 150 100 150 100 149 100 149 100 147 100 148 99 148 99M151 104 150 104 150 103 151 104M151 104 150 104 150 104 151 104M150 105 150 105 150 105 150 105M150 105 150 105 150 105 150 105M150 105 150 105 150 105 150 105M150 105 150 105 150 105 150 105M80 125 80 126 81 126M84 122 85 122 85 122M85 119 85 119 85 119 84 118M87 117 88 117 89 117 89 118M89 118 90 120 90 120 91 120 91 120M99 126 96 128 94 131 93 135 91 138 90 141 90 143 89 146 89 149 89 148 88 149 86 148 86 148 85 149 84 149 84 149 84 150 81 149 82 148 82 148 82 147 81 147 80 148 80 147 79 148 76 147 76 148 75 148 73 147 72 147 72 147 72 147 71 147 71 146 70 146 70 145 70 146 69 146 70 145 69 146 69 146 68 146 67 146 66 146 64 146 64 146 63 146 63 147 62 145 63 144 61 144 61 144 60 144 59 144 59 142 58 142 58 143 54 143 53 144 53 140 54 137 54 130 55 124 56 123 58 122 59 118 58 115 59 115 60 115 61 114 61 114 63 114 64 114 65 115 66 114M73 112 73 112 75 112 76 113M53 140 53 143 53 144 54 143 54 145 54 147 53 149 53 150 52 150 52 150 51 151 50 151 50 150 50 150 49 150 49 150 48 151 48 150 48 150 47 150 47 151 46 151 47 149 47 149 47 147 47 147 46 147 47 147 47 148 45 148 45 149 44 149 43 149 43 148 43 148 44 147 44 147 44 147 43 147 43 147 42 147 41 147 41 147 41 148 40 148 40 149 40 149 39 150 38 150 37 150 37 150 36 149 36 149 35 149 35 149 34 149 34 148 34 147 33 147 34 146 33 145 33 145 32 146 31 145 31 145 31 145 31 145 31 144 30 144 30 145 29 145 29 145 28 145 28 146 27 145 27 145 27 145 26 144 26 144 26 144 26 143 25 144 25 143 24 142 24 142 24 143 23 143 23 144 22 143 21 142 19 143 19 142 19 143 18 142 16 142 16 144 15 144 14 145 12 144 11 145 10 145 10 144 11 144 11 144 11 143 10 142 10 142 10 141 11 141 11 141 10 141 11 140 10 140 10 139 8 139 8 139 8 139 8 138 7 137 7 136 6 135 6 134 7 135 7 131 9 130 10 131 10 130 9 129 9 129 9 129 9 128 8 128 8 128 8 127 8 125 7 125 8 123 11 122 13 122 17 122 18 122 21 123 23 123 24 124 25 124 26 124 28 124 30 124 30 123 32 124 33 124 34 125 34 123 35 123 35 124 35 125 36 125 37 125 37 125 38 125 39 124 38 123 38 123 40 122 41 120 42 120 42 120 43 119 45 119 46 119 48 119 50 118 50 118 51 118 52 120 53 120 55 120 56 119 56 118 56 117 57 116 57 117 57 118 58 118 58 117 58 119 58 122M37 150 37 150 36 151 36 152 36 153 37 153 36 154 36 153 35 155 36 156 35 157 36 157 36 157 37 157 37 159 36 159 35 161 35 161 35 161 34 162 33 161 33 161 33 160 32 161 33 162 33 163 36 165 36 166 39 167 40 168 41 168 41 168 43 168 44 169 45 169 44 171 45 171 45 172 45 173 46 174 46 174 45 174 46 175 45 176 46 176 46 177 45 177 44 178 44 178 43 178 43 178 43 178 42 179 42 179 42 179 42 179 41 179 41 180 40 181 40 181 41 182 40 183 37 182 37 182 37 181 37 180 36 180 36 180 35 179 35 180 33 180 33 181 32 181 32 180 33 179 33 179 33 178 33 178 31 179 31 179 31 178 29 178 29 178 28 179 29 179 29 180 29 180 29 180 28 181 28 181 28 181 28 182 26 182 26 184 26 184 25 183 25 183 25 182 23 183 23 183 24 184 23 184 23 183 23 183 22 184 21 183 21 183 21 184 21 184 21 185 20 185 20 184 20 184 20 185 19 185 19 185 19 185 19 183 19 182 19 182 18 182 18 182 18 182 18 182 18 182 18 181 17 181 16 181 15 181 15 180 14 181 13 181 13 180 13 180 13 179 13 179 12 180 12 180 12 180 11 180 12 179 11 179 11 179 11 180 10 180 10 181 11 181 11 182 11 183 11 183 9 183 9 184 8 184 8 183 7 183 7 184 6 184 6 182 6 182 6 182 6 181 6 181 7 180 7 179 8 179 8 178 6 178 6 177 5 176 5 175 6 175 6 175 6 174 5 174 5 173 4 173 4 173 3 173 4 172 5 172 5 171 5 171 7 172 7 173 7 174 7 174 7 175 9 175 9 175 10 175 10 176 11 176 11 176 13 176 14 176 14 176 14 176 15 176 15 176 16 177 16 177 16 178 16 178 16 179 16 179 17 179 17 180 18 179 18 179 18 178 18 178 18 177 18 177 17 177 17 176 15 176 16 175 16 175 17 173 17 173 16 174 16 173 17 173 17 172 19 172 20 172 20 171 20 171 20 170 20 169 20 169 19 168 19 169 19 168 18 168 18 167 17 167 17 167 17 168 17 169 17 169 18 170 18 171 17 171 17 170 16 170 16 169 14 169 14 167 13 168 12 168 11 167 10 167 9 169 10 169 10 170 9 170 9 171 8 170 7 170 6 170 5 170 4 169 5 168 5 168 4 168 3 167 3 166 4 165 4 165 5 165 5 164 5 164 6 163 4 163 3 163 3 162 2 162 1 162 1 160 0 160 0 158 1 156 1 155 2 154 2 154 3 154 2 153 3 153 3 152 2 152 3 152 3 150 3 149 2 150 2 149 0 149 0 149 0 149 1 148 0 147 0 146 1 146 2 146 3 147 3 148 4 148 6 148 6 148 7 148 8 148 8 148 9 148 9 148 10 148 10 147 10 146 11 146 11 145 11 145 12 144 12 144 13 145 14 145M69 146 70 146 70 145 70 146M73 147 75 148 76 148M81 149 83 150 84 150M84 149 86 148 86 148 88 149 89 148 89 149 90 156 91 157 92 159 92 160 93 160 92 162 92 167 91 170 91 172 91 175 94 183 94 184 94 186 95 189 94 191 93 191 91 191 91 190 90 190 90 191 90 191 90 190 90 189 90 189 89 189 88 189 88 189 89 189 89 188 88 188 87 186 86 186 86 186 87 185 86 185 84 185 83 183 83 183 82 182 82 183 81 182 81 182 80 182 80 180 80 180 80 179 79 179 78 181 77 181 77 180 77 180 76 179 73 179 73 179 72 180 73 178 73 177 73 177 72 176 73 174 72 171 72 170 71 167 70 167 70 166 69 165 69 163 68 163 68 162 67 160 67 160 66 160 66 159 66 158 65 158 65 157 65 157 65 154 64 152 63 151 63 149 63 146M134 111 134 112 133 111 129 111 129 110 128 110 127 109 127 109 126 109 126 109 125 108 124 107 124 107 123 106 124 106M117 104 115 105 114 103M115 99 116 99 116 98 115 98M113 91 113 91 112 91 112 90 113 91 113 92 113 93 113 93 113 94 113 94 114 97 115 98 116 99 115 99 114 100 114 100 114 101 115 102 114 102 115 102 115 103 114 103 114 102 113 102 114 103 115 104 115 105 117 104 117 104 117 104 118 104 118 104 119 104 119 103 120 103 121 105 121 104 122 104 122 102 123 101 123 101 123 103 124 104 124 103 124 104 124 104 124 106 123 106 124 107 124 108 126 109 126 109 126 109 127 109 128 110 129 110 129 110 129 110 129 111 128 111 125 111 122 113 120 115 120 118 118 120 118 121 115 125 115 125 115 126 114 125 114 126 115 127 115 128 113 129 110 129 110 127 111 125 111 125 112 123 112 123 111 119 111 119 111 118 111 118 111 117 110 115 110 115 110 115 109 114 109 114 109 113 108 111 107 110 106 109 106 108 105 108 106 108 100 104 97 104 96 103 94 103 91 102 91 102 91 101 91 101 91 100 91 98 89 98 89 97 89 97 87 96 88 95 89 95 89 94 89 93 90 93 90 93 91 93 92 92 92 92 93 91 93 92 94 92 95 93 95 92 95 93 95 93 96 93 96 94 96 94 96 95 96 95 96 96 97 96 97 96 98 97 98 98 98 97 98 97 98 97 98 96 99 97 99 97 100 98 100 98 103 99 104 98 104 98 103 97 103 96 104 96 103 95 104 95 104 95 102 94 102 94 101 94 101 95 100 94 97 93 98 92 98 92 98 91 98 90 99 90 99 90 99 91 100 92 100 91 101 91 101 91 101 89 103 89 103 88 104 89 105 89 106 90 105 90 105 91 106 90 106 90 108 90 110 91 111 90 112 91 111 90 111 90 111 89 111 89 111 88 112 88 112 86 113 86 114 87 115 87 116 86 117 86 119 86 119 85 119 84 120 83 122 84 123 82 123 81 122 81 120 80 120 80 120 80 119 80 119 79 118 79 119 79 118 79 118 78 118 78 117 78 117 78 115 78 114 76 111 76 111 75 110 75 111 75 113 75 114 74 115 74 115 75 115 76 117 75 118 76 120 77 121 76 122 77 122 78M59 144 60 144 61 144 61 144 63 144 62 145 63 147 63 149 63 151M73 178 72 180 73 182 73 182 72 183 72 183 72 183 70 183 69 184 68 183 67 183 66 182 66 182 64 180 64 181 63 181 63 180 61 180 60 179 60 179 60 180 59 180 59 180 59 179 58 179 58 180 57 179 57 180 55 180 55 180 55 181 55 181 54 181 53 180 53 180 52 180 51 180 51 179 51 179 50 179 49 179 50 178 49 178 49 177 48 177 47 178 47 178 46 178 46 177 46 177 46 176M46 174 46 174 45 173M36 159 37 159 37 157M36 157 35 157 36 156 35 155 36 153M37 153 36 153 36 151 37 150 38 150 39 150M41 148 41 147 41 147 42 147 43 147M43 149 44 150 45 149M46 147 46 147 47 147 47 147M50 151 51 151 52 150M53 149 54 147 54 145M54 143 54 143M58 142 59 142 59 142M51 179 51 179 51 179 51 179 51 179 51 179 51 179M53 180 54 181 55 181M60 179 61 180M70 183 72 183 72 183 72 183 73 182 73 182 72 180 73 179 73 179M78 181 79 179 80 179M80 182 81 182 81 182 81 182M86 185 87 185 86 186M88 188 89 188 89 189M88 189 87 189 87 190 88 190 88 190 89 190 89 191 88 190 88 191 87 191 87 191 87 192 86 193 86 193 86 193 86 194 86 194 86 194 86 195 85 194 85 195 84 195 84 195 84 195 84 195 82 195 82 196 81 195 81 196 80 196 82 198 82 198 81 198 81 199 81 199 80 198 80 198 79 198 80 197 79 197 79 198 79 198 79 197 79 197 79 196 78 197 78 196 78 196 77 197 77 197 77 196 77 196 76 197 76 197 75 197 75 196 75 195 75 195 74 195 74 195 73 195 72 195 72 195 71 195 71 195 71 195 71 196 71 196 71 196 72 196 72 196 72 196 72 197 71 197 72 197 72 198 72 198 72 198 73 198 73 198 72 198 72 199 71 199 71 199 70 199 71 200 70 200 70 201 70 201 70 200 69 201 68 201 69 201 68 201 68 200 68 200 67 200 67 200 67 200 67 200 66 200 67 200 67 201 66 202 65 202 66 202 65 203 66 203 65 203 66 203 65 203 65 204 64 203 63 204 62 203 62 203 60 202 60 202 60 202 58 202 58 203 59 203 59 203 58 203 58 202 57 202 57 202 56 202 55 202 55 202 54 203 53 202 52 204 51 203 51 204 50 205 51 205 51 205 51 206 51 206 50 208 50 209 49 210 48 211 49 211 48 211 49 212 48 213 48 213 48 212 48 212 48 212 48 212 47 212 47 211 47 212 47 212 47 212 47 213 46 213 46 214 46 215 45 214 44 215 42 214 41 212 40 212 40 213 39 213 40 212 40 211 40 210 40 208 41 208 42 208 42 208 43 208 42 207 42 207 43 207 43 206 44 207 44 207 45 207 45 207 46 208 46 207 45 206 45 206 45 206 45 205 45 205 46 205 46 205 46 204 46 203 47 203 47 202 48 201 47 201 48 200 48 200 49 200 49 199 48 199 48 199 49 198 49 198 49 197 49 197 49 196 49 196 48 196 48 197 47 196 46 196 46 195 45 196 45 195 45 195 44 196 44 195 44 195 44 195 44 195 43 194 44 193 44 190 44 188 44 188 42 188 40 188 40 188 40 188 39 188 39 189 39 188 39 187 39 187 38 187 38 186 38 186 37 186 36 186 36 186 35 186 35 185 37 185 37 184 36 184 37 182 40 183M45 177 46 177 46 177')
  static Path get andhraPradeshBoundary => _$AndhraPradeshMapSvgData_andhraPradeshBoundary;
  
  @SvgPath('M186 61 185 61 185 61 185 60 185 59 185 58 186 58 186 58 186 58 187 56 188 56 186 55 185 55 185 55 185 55 185 55 184 54 185 53 185 53 184 52 184 52 184 52 184 51 184 51 185 51 184 50 184 50 185 50 185 48 184 48 184 48 183 49 183 49 183 48 183 48 184 47 183 47 183 46 184 45 183 45 183 44 184 43 184 43 184 43 185 43 185 42 186 42 186 42 187 41 188 42 189 42 189 41 189 41 190 40 190 40 190 40 189 39 189 38 189 38 189 38 190 38 189 37 189 37 189 36 189 35 189 35 190 35 191 37 191 38 191 38 191 39 192 41 193 41 194 41 194 41 195 41 196 41 198 43 199 42 199 42 199 42 200 42 200 42 201 42 201 42 201 41 202 42 203 42 203 41 204 42 204 41 205 41 204 41 205 41 205 40 204 40 204 39 204 39 205 40 205 40 206 39 205 39 206 39 206 39 206 38 207 39 207 38 207 38 207 38 207 37 207 37 208 36 207 36 207 35 208 36 208 35 209 34 210 34 211 34 211 34 211 35 212 35 212 34 213 34 213 34 213 33 212 33 212 33 212 33 211 32 213 32 213 31 214 31 215 31 215 32 214 32 214 32 216 34 214 37 214 37 212 39 210 41 210 42 209 43 208 44 207 45 205 47 205 48 199 54 199 54 199 55 194 58 189 61 186 62Z')
static Path get srikakulam => _$AndhraPradeshMapSvgData_srikakulam;


@SvgPath('M189 39 190 40 190 40 190 40 190 41 189 41 189 42 188 42 187 41 186 42 186 42 185 42 185 43 184 43 184 43 184 43 183 44 183 45 184 45 183 46 183 47 184 47 183 48 183 48 183 49 183 49 184 48 184 48 185 48 185 50 184 50 184 50 185 51 184 51 184 51 184 52 184 52 184 52 185 53 185 53 184 54 185 55 185 55 185 55 185 55 186 55 188 56 187 56 186 58 186 58 186 58 185 58 185 59 185 59 185 60 185 60 185 61 185 61 186 61 186 62 184 64 183 66 181 66 181 65 181 65 181 66 180 66 181 66 180 66 179 65 180 64 180 64 179 64 179 63 179 63 178 62 178 63 177 63 177 63 177 63 177 64 176 64 176 64 176 64 175 66 174 66 175 66 175 66 175 67 175 67 175 68 174 68 174 69 172 69 172 68 172 68 172 67 171 66 171 66 170 66 170 65 169 65 169 64 169 63 169 63 169 62 170 62 170 62 172 61 172 61 171 61 172 61 171 60 172 60 171 60 172 59 171 59 172 59 173 59 172 59 173 58 173 58 174 59 174 59 174 58 175 58 175 58 175 57 176 58 175 56 175 56 174 56 174 55 173 55 173 55 172 55 172 54 172 54 171 54 171 54 171 54 171 54 170 54 171 52 171 53 170 53 170 52 170 52 170 52 169 52 169 52 169 51 170 50 171 49 171 48 170 49 170 49 169 48 170 47 170 47 169 47 169 47 169 47 168 47 168 47 169 46 169 46 170 45 170 44 172 43 171 42 172 42 173 42 173 42 174 43 174 43 174 43 174 42 176 42 176 41 177 41 177 41 177 41 178 40 179 41 179 40 180 39 179 39 179 38 178 38 178 38 178 37 178 37 178 37 178 37 178 38 177 38 177 37 177 37 177 37 177 36 177 36 177 36 178 35 178 35 178 36 179 35 180 36 180 36 180 36 180 37 181 37 181 36 181 36 180 35 181 35 181 35 181 34 181 33 181 33 181 33 181 33 181 33 182 34 182 34 182 35 182 35 182 35 182 35 183 35 183 35 183 34 183 33 184 33 184 34 184 34 184 33 185 33 185 32 185 32 185 31 186 31 186 32 186 32 186 32 186 33 186 33 187 34 187 35 188 35 188 36 188 36Z')
static Path get vizianagaram => _$AndhraPradeshMapSvgData_vizianagaram;


@SvgPath('M171 54 171 54 171 54 171 54 172 54 172 54 172 55 173 55 173 55 174 55 174 55 174 56 175 56 176 58 175 57 175 58 175 58 174 58 174 58 174 59 174 59 174 59 173 58 173 58 172 59 173 59 172 59 171 59 172 59 171 60 172 60 171 60 172 61 171 61 172 61 172 61 170 62 170 62 169 62 169 63 169 63 169 64 169 65 170 65 170 66 171 66 171 66 172 67 172 68 172 68 172 69 174 69 174 68 175 68 175 67 175 67 175 66 175 66 174 66 175 66 176 64 176 64 176 64 177 64 177 63 177 63 177 63 178 63 178 62 179 63 179 63 179 64 180 64 180 64 179 65 180 66 181 66 180 66 181 66 181 65 181 65 181 66 182 65 183 66 181 67 180 68 180 68 180 70 178 71 178 72 177 73 177 73 177 73 176 73 176 73 175 75 175 75 174 76 173 77 169 78 168 79 160 83 156 85 155 84 156 84 156 83 156 83 157 83 156 82 158 79 157 79 156 78 156 78 155 78 155 78 154 77 154 78 154 78 154 79 152 79 151 79 152 78 151 79 150 78 151 78 150 77 151 76 150 76 149 75 149 75 148 75 147 74 146 75 146 75 145 74 144 74 143 75 143 74 142 75 142 75 141 74 142 74 142 74 142 74 142 72 142 72 142 71 141 71 140 71 141 71 140 72 138 72 138 71 139 70 139 70 140 69 141 68 142 69 142 69 142 69 141 67 142 66 142 65 142 65 141 64 142 63 142 63 142 62 142 63 143 63 143 62 144 62 145 62 145 63 146 63 146 63 146 64 147 64 148 64 149 64 149 64 148 63 149 63 150 62 149 63 150 63 150 62 150 63 151 63 151 62 150 61 151 60 151 60 151 60 151 59 150 59 150 58 150 58 150 58 150 57 151 56 152 56 152 56 152 55 151 55 150 55 152 54 152 53 151 52 153 50 153 50 155 49 155 49 155 50 156 50 156 50 156 51 155 51 156 52 156 51 157 51 156 53 157 53 158 54 158 54 158 54 158 55 157 55 157 55 158 56 157 56 159 57 159 57 159 57 159 56 159 56 159 56 162 54 163 54 162 53 163 53 163 53 163 53 162 52 163 51 164 52 164 52 166 52 166 53 167 54 168 54 168 53 169 53 170 53 171 52 171 52Z')
static Path get vishakapatnam => _$AndhraPradeshMapSvgData_vishakapatnam;


@SvgPath('M112 129 113 129ZM109 128 109 128 109 128ZM109 128 109 128 109 128ZM109 127 109 127 109 127ZM109 127 109 127 109 127ZM115 127 115 126 115 126ZM115 126 115 126 115 126ZM109 125 109 125 109 125ZM109 125 109 125 109 125ZM109 125 109 125 109 125ZM108 124 109 125 108 124ZM112 91 112 90 113 91 113 92 113 93 113 93 113 94 113 94 114 97 115 98 116 99 115 99 114 100 114 100 114 101 115 102 114 102 115 102 115 103 114 103 114 102 113 102 114 103 115 104 115 105 117 104 117 104 117 104 118 104 118 104 119 104 119 103 120 103 121 105 121 104 122 104 122 102 123 101 123 101 123 103 124 104 124 103 124 104 124 104 124 106 123 106 124 107 124 108 126 109 126 109 126 109 127 109 128 110 129 110 129 110 129 110 129 111 128 111 125 111 122 113 120 115 120 118 118 120 118 121 115 125 115 125 115 126 114 125 114 126 115 127 115 128 113 129 110 129 110 127 111 125 111 125 112 123 112 123 111 119 111 119 111 118 111 118 111 117 110 115 110 115 110 115 109 114 109 114 109 113 108 111 107 110 106 109 106 108 105 108 106 108 100 104 97 104 96 103 94 103 91 102 91 102 91 101 91 101 91 100 91 98 89 98 89 97 89 97 87 96 88 95 89 95 89 94 89 93 90 93 90 93 91 93 92 92 92 92 93 91 93 92 94 92 95 93 95 92 95 93 95 93 96 93 96 94 96 94 96 95 96 95 96 96 97 96 97 96 98 97 98 98 98 97 98 97 98 97 98 96 99 97 99 97 100 98 100 98 103 99 104 98 104 98 103 97 103 96 104 96 103 95 104 95 104 95 102 94 102 94 101 94 101 95 100 94 97 93 98 92 98 92 98 91 98 90 99 90 99 90 99 91 100 92 100 91 101 91 101 91 101 89 103 89 103 88 104 89 105 89 106 90 105 90 105 91 106 90 106 90 108 90 110 91 111 90Z')
static Path get krishna => _$AndhraPradeshMapSvgData_krishna;


@SvgPath('M91 102 94 103 96 103 97 104 100 104 102 105 102 106 105 107 106 109 107 110 108 111 109 113 109 114 109 114 110 115 110 115 110 115 111 117 111 118 111 118 111 119 111 119 112 123 112 123 111 125 111 125 110 127 110 129 109 129 109 127 109 127 109 128 110 129 108 125 109 126 109 126 109 126 109 125 108 124 106 124 102 125 99 126 99 126 100 126 100 125 100 125 100 125 99 124 98 125 98 124 98 121 99 122 99 121 97 120 97 120 96 120 96 120 96 119 96 119 95 119 94 119 94 119 94 120 93 120 92 120 92 119 91 119 91 120 90 120 90 119 89 119 89 118 89 118 89 118 89 117 88 117 87 117 87 117 86 116 86 117 86 117 84 116 84 117 84 117 84 118 85 119 85 119 84 120 84 121 84 121 85 121 85 121 85 122 85 122 84 122 84 123 82 122 82 123 81 123 81 125 81 125 81 126 80 125 80 125 79 124 79 123 78 123 78 123 77 123 77 123 76 122 76 122 76 120 75 119 75 118 75 117 75 116 76 115 76 113 75 112 74 112 73 112 70 114 68 115 66 116 66 114 67 111 66 111 66 110 66 108 67 108 66 107 66 106 67 106 67 105 68 105 70 104 72 104 73 103 73 103 74 103 75 103 77 102 78 102 79 101 80 101 81 100 81 100 82 100 83 101 83 101 84 101 85 103 86 103 87 102 87 101 88 101 89 100 89 98 90 98 91 98Z')
static Path get guntur => _$AndhraPradeshMapSvgData_guntur;


@SvgPath('M142 66 141 67 142 69 142 69 142 69 141 68 140 69 139 70 139 70 138 71 138 72 140 72 141 71 140 71 141 71 142 71 142 72 142 72 142 74 142 74 142 74 141 74 142 75 142 75 143 74 143 75 144 74 145 74 146 75 146 75 147 75 148 74 148 75 149 75 149 75 150 76 151 76 150 77 151 78 150 78 151 79 152 78 151 79 152 79 153 79 154 79 154 78 154 78 154 77 155 78 155 78 156 78 156 78 157 79 158 80 157 81 156 82 157 83 156 83 156 83 156 84 155 84 156 85 153 88 150 91 149 92 149 94 149 94 148 94 148 96 148 96 149 96 149 96 149 96 149 96 149 96 150 96 150 97 150 96 151 97 151 96 151 97 151 94 150 93 151 93 151 94 151 96 151 100 151 100 151 101 150 102 150 103 150 105 148 105 140 110 137 110 134 112 134 112 134 111 133 109 134 108 134 109 135 109 136 107 137 107 138 104 137 102 136 101 136 100 135 99 135 98 135 97 134 95 134 94 135 93 134 92 134 91 133 90 132 87 132 85 133 84 133 84 131 83 131 82 131 81 130 81 130 80 129 80 128 79 126 79 125 79 124 78 123 79 122 78 122 78 121 77 118 76 118 75 115 76 115 75 115 74 114 74 114 74 113 75 112 74 112 74 112 74 112 73 111 73 112 73 111 72 114 70 114 71 116 71 116 72 117 71 117 70 117 70 119 68 122 70 124 69 125 70 125 69 126 69 126 69 126 69 127 69 128 69 130 69 130 69 131 69 132 69 132 68 133 67 133 67 134 68 136 66 136 65 139 65 139 64 140 64 141 64 141 64 141 64 142 65ZM148 99 147 100 146 100 147 100 148 100 149 101 150 100 150 100 149 100 149 100 147 100 148 99ZM151 104 150 104 150 103ZM151 104 150 104 150 104ZM150 105 150 105 150 105ZM150 105 150 105 150 105ZM150 105 150 105 150 105ZM150 105 150 105 150 105Z')
static Path get eastGodavari => _$AndhraPradeshMapSvgData_eastGodavari;


@SvgPath('M76 115 75 116 75 117 75 118 75 119 76 120 76 122 76 122 77 123 77 123 78 123 78 123 79 123 79 124 80 125 80 125 80 126 81 126 81 125 81 125 81 123 82 123 82 122 84 123 84 122 85 122 85 122 85 121 85 121 84 121 84 121 84 120 85 119 85 119 85 119 84 118 84 117 84 117 84 116 86 117 86 117 86 116 87 117 87 117 88 117 89 117 89 118 89 118 89 118 90 120 90 120 91 120 91 120 91 119 92 119 92 120 93 120 94 120 94 119 94 119 95 119 96 119 96 119 96 120 96 120 97 120 97 120 99 121 99 122 98 121 98 124 98 125 99 124 100 125 100 125 100 125 100 126 99 126 99 126 96 128 94 131 93 135 91 138 90 141 90 143 89 146 89 149 89 148 88 149 86 148 86 148 85 149 84 149 84 149 84 150 81 149 82 148 82 148 82 147 81 147 80 148 80 147 79 148 76 147 76 148 75 148 73 147 72 147 72 147 72 147 71 147 71 146 70 146 70 145 70 146 69 146 70 145 69 146 69 146 68 146 67 146 66 146 64 146 64 146 63 146 63 147 62 145 63 144 61 144 61 144 60 144 59 144 59 142 58 142 58 143 54 143 53 144 53 140 54 137 54 130 55 124 56 123 58 122 59 118 58 115 59 115 60 115 61 114 61 114 63 114 64 114 65 115 66 114 66 116 68 115 70 114 73 112 73 112 75 112Z')
static Path get prakasam => _$AndhraPradeshMapSvgData_prakasam;


@SvgPath('M37 150 36 151 36 152 36 153 37 153 36 154 36 153 35 155 36 156 35 157 36 157 36 157 37 157 37 159 36 159 35 161 35 161 35 161 34 162 33 161 33 161 33 160 32 161 33 162 33 163 36 165 36 166 39 167 40 168 41 168 41 168 43 168 44 169 45 169 44 171 45 171 45 172 45 173 46 174 46 174 45 174 46 175 45 176 46 176 46 177 45 177 44 178 44 178 43 178 43 178 43 178 42 179 42 179 42 179 42 179 41 179 41 180 40 181 40 181 41 182 40 183 37 182 37 182 37 181 37 180 36 180 36 180 35 179 35 180 33 180 33 181 32 181 32 180 33 179 33 179 33 178 33 178 31 179 31 179 31 178 29 178 29 178 28 179 29 179 29 180 29 180 29 180 28 181 28 181 28 181 28 182 26 182 26 184 26 184 25 183 25 183 25 182 23 183 23 183 24 184 23 184 23 183 23 183 22 184 21 183 21 183 21 184 21 184 21 185 20 185 20 184 20 184 20 185 19 185 19 185 19 185 19 183 19 182 19 182 18 182 18 182 18 182 18 182 18 182 18 181 17 181 16 181 15 181 15 180 14 181 13 181 13 180 13 180 13 179 13 179 12 180 12 180 12 180 11 180 12 179 11 179 11 179 11 180 10 180 10 181 11 181 11 182 11 183 11 183 9 183 9 184 8 184 8 183 7 183 7 184 6 184 6 182 6 182 6 182 6 181 6 181 7 180 7 179 8 179 8 178 6 178 6 177 5 176 5 175 6 175 6 175 6 174 5 174 5 173 4 173 4 173 3 173 4 172 5 172 5 171 5 171 7 172 7 173 7 174 7 174 7 175 9 175 9 175 10 175 10 176 11 176 11 176 13 176 14 176 14 176 14 176 15 176 15 176 16 177 16 177 16 178 16 178 16 179 16 179 17 179 17 180 18 179 18 179 18 178 18 178 18 177 18 177 17 177 17 176 15 176 16 175 16 175 17 173 17 173 16 174 16 173 17 173 17 172 19 172 20 172 20 171 20 171 20 170 20 169 20 169 19 168 19 169 19 168 18 168 18 167 17 167 17 167 17 168 17 169 17 169 18 170 18 171 17 171 17 170 16 170 16 169 14 169 14 167 13 168 12 168 11 167 10 167 9 169 10 169 10 170 9 170 9 171 8 170 7 170 6 170 5 170 4 169 5 168 5 168 4 168 3 167 3 166 4 165 4 165 5 165 5 164 5 164 6 163 4 163 3 163 3 162 2 162 1 162 1 160 0 160 0 158 1 156 1 155 2 154 2 154 3 154 2 153 3 153 3 152 2 152 3 152 3 150 3 149 2 150 2 149 0 149 0 149 0 149 1 148 0 147 0 146 1 146 2 146 3 147 3 148 4 148 6 148 6 148 7 148 8 148 8 148 9 148 9 148 10 148 10 147 10 146 11 146 11 145 11 145 12 144 12 144 13 145 14 145 15 144 16 144 16 142 18 142 19 143 19 142 19 143 21 142 22 143 23 144 23 143 24 143 24 142 24 142 25 143 25 144 26 143 26 144 26 144 26 144 27 145 27 145 27 145 28 146 28 145 29 145 29 145 30 145 30 144 31 144 31 145 31 145 31 145 31 145 32 146 33 145 33 145 34 146 33 147 34 147 34 148 34 149 35 149 35 149 36 149 36 149Z')
static Path get anantpur => _$AndhraPradeshMapSvgData_anantpur;


@SvgPath('M70 146 70 145 70 146 71 146 71 147 72 147 72 147 72 147 73 147 75 148 76 148 76 147 79 148 80 147 80 148 81 147 82 147 82 148 82 148 81 149 83 150 84 150 84 149 86 148 86 148 88 149 89 148 89 149 90 156 91 157 92 159 92 160 93 160 92 162 92 167 91 170 91 172 91 175 94 183 94 184 94 186 95 189 94 191 93 191 91 191 91 190 90 190 90 191 90 191 90 190 90 189 90 189 89 189 88 189 88 189 89 189 89 188 88 188 87 186 86 186 86 186 87 185 86 185 84 185 83 183 83 183 82 182 82 183 81 182 81 182 80 182 80 180 80 180 80 179 79 179 78 181 77 181 77 180 77 180 76 179 73 179 73 179 72 180 73 178 73 177 73 177 72 176 73 174 72 171 72 170 71 167 70 167 70 166 69 165 69 163 68 163 68 162 67 160 67 160 66 160 66 159 66 158 65 158 65 157 65 157 65 154 64 152 63 151 63 149 63 146 64 146 64 146 66 146 67 146 68 146 69 146 69 146 70 145Z')
static Path get spsNellore => _$AndhraPradeshMapSvgData_spsNellore;



@SvgPath('M123 79 124 78 125 79 126 79 128 79 129 80 130 80 130 81 131 81 131 82 131 83 133 84 133 84 132 85 132 87 133 90 134 91 134 92 135 93 134 94 134 95 135 97 135 98 135 99 136 100 136 101 137 102 138 104 137 107 136 107 135 109 134 109 134 108 133 109 134 111 134 112 133 111 129 111 129 110 128 110 127 109 127 109 126 109 126 109 125 108 124 107 124 107 123 106 124 106 124 104 124 104 124 103 124 104 123 103 123 101 123 101 122 102 122 104 121 104 121 105 120 103 119 103 119 104 118 104 118 104 117 104 117 104 117 104 115 105 114 103 113 102 114 102 114 103 115 103 115 102 114 102 115 102 114 101 114 100 114 100 115 99 116 99 116 98 115 98 114 97 113 94 113 94 113 93 113 93 113 92 113 91 113 91 112 91 111 90 111 90 111 89 111 89 111 88 112 88 112 86 113 86 114 87 115 87 116 86 117 86 119 86 119 85 119 84 120 83 122 84 123 82 123 81 122 81 120 80 120 80 120 80 119 80 119 79 118 79 119 79 118 79 118 78 118 78 117 78 117 78 115 78 114 76 111 76 111 75 110 75 111 75 113 75 114 74 115 74 115 75 115 76 117 75 118 76 120 77 121 76 122 77Z')
static Path get westGodavari => _$AndhraPradeshMapSvgData_westGodavari;


@SvgPath('M59 144 60 144 61 144 61 144 63 144 62 145 63 147 63 149 63 151 64 152 65 154 65 157 65 157 65 158 66 158 66 159 66 160 67 160 67 160 68 162 68 163 69 163 69 165 70 166 70 167 71 167 72 170 72 171 73 174 72 176 73 177 73 177 73 178 72 180 73 182 73 182 72 183 72 183 72 183 70 183 69 184 68 183 67 183 66 182 66 182 64 180 64 181 63 181 63 180 61 180 60 179 60 179 60 180 59 180 59 180 59 179 58 179 58 180 57 179 57 180 55 180 55 180 55 181 55 181 54 181 53 180 53 180 52 180 51 180 51 179 51 179 50 179 49 179 50 178 49 178 49 177 48 177 47 178 47 178 46 178 46 177 46 177 46 176 45 176 46 175 45 174 46 174 46 174 45 173 45 172 45 171 44 171 45 169 44 169 43 168 41 168 41 168 40 168 39 167 36 166 36 165 33 163 33 162 32 161 33 160 33 161 33 161 34 162 35 161 35 161 35 161 36 159 37 159 37 157 36 157 36 157 35 157 36 156 35 155 36 153 36 154 37 153 36 153 36 151 37 150 38 150 39 150 40 149 40 149 40 148 41 148 41 147 41 147 42 147 43 147 43 147 44 147 44 147 44 147 43 148 43 148 43 149 44 150 45 149 45 148 47 148 47 147 46 147 46 147 47 147 47 147 47 149 47 149 46 151 47 151 47 150 48 150 48 150 48 151 49 150 49 150 50 150 50 150 50 151 51 151 52 150 52 150 53 150 53 149 54 147 54 145 54 143 54 143 58 143 58 142 59 142ZM51 179 51 179 51 179Z')
static Path get ysr => _$AndhraPradeshMapSvgData_ysr;


@SvgPath('M51 179 51 179ZM46 177 46 178 47 178 47 178 48 177 49 177 49 178 50 178 49 179 50 179 51 179 51 179 51 180 52 180 53 180 53 180 54 181 55 181 55 181 55 180 55 180 57 180 57 179 58 180 58 179 59 179 59 180 59 180 60 180 60 179 61 180 63 180 63 181 64 181 64 180 66 182 66 182 67 183 68 183 69 184 70 183 72 183 72 183 72 183 73 182 73 182 72 180 73 179 73 179 73 179 76 179 77 180 77 180 77 181 78 181 79 179 80 179 80 180 80 180 80 182 81 182 81 182 81 182 82 183 82 182 83 183 83 183 84 185 86 185 87 185 86 186 86 186 87 186 88 188 89 188 89 189 88 189 88 189 87 189 87 190 88 190 88 190 89 190 89 191 88 190 88 191 87 191 87 191 87 192 86 193 86 193 86 193 86 194 86 194 86 194 86 195 85 194 85 195 84 195 84 195 84 195 84 195 82 195 82 196 81 195 81 196 80 196 82 198 82 198 81 198 81 199 81 199 80 198 80 198 79 198 80 197 79 197 79 198 79 198 79 197 79 197 79 196 78 197 78 196 78 196 77 197 77 197 77 196 77 196 76 197 76 197 75 197 75 196 75 195 75 195 74 195 74 195 73 195 72 195 72 195 71 195 71 195 71 195 71 196 71 196 71 196 72 196 72 196 72 196 72 197 71 197 72 197 72 198 72 198 72 198 73 198 73 198 72 198 72 199 71 199 71 199 70 199 71 200 70 200 70 201 70 201 70 200 69 201 68 201 69 201 68 201 68 200 68 200 67 200 67 200 67 200 67 200 66 200 67 200 67 201 66 202 65 202 66 202 65 203 66 203 65 203 66 203 65 203 65 204 64 203 63 204 62 203 62 203 60 202 60 202 60 202 58 202 58 203 59 203 59 203 58 203 58 202 57 202 57 202 56 202 55 202 55 202 54 203 53 202 52 204 51 203 51 204 50 205 51 205 51 205 51 206 51 206 50 208 50 209 49 210 48 211 49 211 48 211 49 212 48 213 48 213 48 212 48 212 48 212 48 212 47 212 47 211 47 212 47 212 47 212 47 213 46 213 46 214 46 215 45 214 44 215 42 214 41 212 40 212 40 213 39 213 40 212 40 211 40 210 40 208 41 208 42 208 42 208 43 208 42 207 42 207 43 207 43 206 44 207 44 207 45 207 45 207 46 208 46 207 45 206 45 206 45 206 45 205 45 205 46 205 46 205 46 204 46 203 47 203 47 202 48 201 47 201 48 200 48 200 49 200 49 199 48 199 48 199 49 198 49 198 49 197 49 197 49 196 49 196 48 196 48 197 47 196 46 196 46 195 45 196 45 195 45 195 44 196 44 195 44 195 44 195 44 195 43 194 44 193 44 190 44 188 44 188 42 188 40 188 40 188 40 188 39 188 39 189 39 188 39 187 39 187 38 187 38 186 38 186 37 186 36 186 36 186 35 186 35 185 37 185 37 184 36 184 37 182 40 183 41 182 40 181 40 181 41 180 41 179 42 179 42 179 42 179 42 179 43 178 43 178 43 178 44 178 44 178 45 177 46 177Z')
static Path get chittoor => _$AndhraPradeshMapSvgData_chittoor;


@SvgPath('M56 123 55 124 54 130 54 137 53 140 53 143 53 144 54 143 54 145 54 147 53 149 53 150 52 150 52 150 51 151 50 151 50 150 50 150 49 150 49 150 48 151 48 150 48 150 47 150 47 151 46 151 47 149 47 149 47 147 47 147 46 147 47 147 47 148 45 148 45 149 44 149 43 149 43 148 43 148 44 147 44 147 44 147 43 147 43 147 42 147 41 147 41 147 41 148 40 148 40 149 40 149 39 150 38 150 37 150 37 150 36 149 36 149 35 149 35 149 34 149 34 148 34 147 33 147 34 146 33 145 33 145 32 146 31 145 31 145 31 145 31 145 31 144 30 144 30 145 29 145 29 145 28 145 28 146 27 145 27 145 27 145 26 144 26 144 26 144 26 143 25 144 25 143 24 142 24 142 24 143 23 143 23 144 22 143 21 142 19 143 19 142 19 143 18 142 16 142 16 144 15 144 14 145 12 144 11 145 10 145 10 144 11 144 11 144 11 143 10 142 10 142 10 141 11 141 11 141 10 141 11 140 10 140 10 139 8 139 8 139 8 139 8 138 7 137 7 136 6 135 6 134 7 135 7 131 9 130 10 131 10 130 9 129 9 129 9 129 9 128 8 128 8 128 8 127 8 125 7 125 8 123 11 122 13 122 17 122 18 122 21 123 23 123 24 124 25 124 26 124 28 124 30 124 30 123 32 124 33 124 34 125 34 123 35 123 35 124 35 125 36 125 37 125 37 125 38 125 39 124 38 123 38 123 40 122 41 120 42 120 42 120 43 119 45 119 46 119 48 119 50 118 50 118 51 118 52 120 53 120 55 120 56 119 56 118 56 117 57 116 57 117 57 118 58 118 58 117 58 119Z')
static Path get kurnool => _$AndhraPradeshMapSvgData_kurnool;
}
