; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [332 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [658 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 251
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 285
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 144
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 326
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 207
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 98325684, ; 13: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 188
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 269
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 269
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 138
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 289
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 225
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 271
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 150
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 323
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 324
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 223
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 31: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 187
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 245
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 254259026, ; 37: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 174
	i32 261689757, ; 38: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 228
	i32 276479776, ; 39: System.Threading.Timer.dll => 0x107abf20 => 146
	i32 278686392, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 247
	i32 280482487, ; 41: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 244
	i32 280992041, ; 42: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 295
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 291275502, ; 44: Microsoft.Extensions.Http.dll => 0x115c82ee => 194
	i32 298918909, ; 45: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 46: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 323
	i32 318968648, ; 47: Xamarin.AndroidX.Activity.dll => 0x13031348 => 214
	i32 321597661, ; 48: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 49: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 308
	i32 342366114, ; 50: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 246
	i32 356389973, ; 51: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 307
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 148
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 144
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 145
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 328
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 164
	i32 435591531, ; 61: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 319
	i32 441335492, ; 62: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 229
	i32 442565967, ; 63: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 64: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 242
	i32 451504562, ; 65: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 66: System.Web.HttpUtility.dll => 0x1b317bfd => 151
	i32 459347974, ; 67: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 68: mscorlib => 0x1bc4415d => 165
	i32 469710990, ; 69: System.dll => 0x1bff388e => 163
	i32 476646585, ; 70: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 244
	i32 486930444, ; 71: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 257
	i32 494518688, ; 72: CryptoTracker.sdk => 0x1d79c1a0 => 327
	i32 498788369, ; 73: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 74: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 306
	i32 503918385, ; 75: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 300
	i32 513247710, ; 76: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 200
	i32 526420162, ; 77: System.Transactions.dll => 0x1f6088c2 => 149
	i32 527452488, ; 78: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 289
	i32 530272170, ; 79: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 80: Microsoft.Extensions.Logging => 0x20216150 => 195
	i32 540030774, ; 81: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 82: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 83: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 84: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 85: Jsr305Binding => 0x213954e7 => 282
	i32 569601784, ; 86: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 280
	i32 571435654, ; 87: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 191
	i32 577335427, ; 88: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 89: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 314
	i32 601371474, ; 90: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 234
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 312
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 240
	i32 643868501, ; 96: System.Net => 0x2660a755 => 80
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 135
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 276
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 221
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 102: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 294
	i32 690569205, ; 103: System.Xml.Linq.dll => 0x29293ff5 => 154
	i32 691348768, ; 104: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 291
	i32 693804605, ; 105: System.Windows => 0x295a9e3d => 153
	i32 699345723, ; 106: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 107: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 286
	i32 700358131, ; 108: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 109: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 309
	i32 709557578, ; 110: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 297
	i32 720511267, ; 111: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 290
	i32 722857257, ; 112: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 731701662, ; 113: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 199
	i32 735137430, ; 114: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 752232764, ; 115: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 116: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 211
	i32 759454413, ; 117: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 118: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 119: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 120: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 318
	i32 789151979, ; 121: Microsoft.Extensions.Options => 0x2f0980eb => 198
	i32 790371945, ; 122: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 235
	i32 804008546, ; 123: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 178
	i32 804715423, ; 124: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 249
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 159
	i32 834051424, ; 129: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 130: Xamarin.AndroidX.Print => 0x3246f6cd => 262
	i32 873119928, ; 131: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 132: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 133: System.Net.Http.Json => 0x3463c971 => 62
	i32 904024072, ; 134: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 135: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 136: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 321
	i32 928116545, ; 137: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 285
	i32 952186615, ; 138: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 956575887, ; 139: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 290
	i32 966729478, ; 140: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 283
	i32 967690846, ; 141: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 246
	i32 975236339, ; 142: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 143: System.Xml.XDocument => 0x3a2aaa1d => 157
	i32 986514023, ; 144: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 145: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 146: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 999186168, ; 148: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 193
	i32 1001831731, ; 149: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 266
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 186
	i32 1029334545, ; 153: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 296
	i32 1031528504, ; 154: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 284
	i32 1035644815, ; 155: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 219
	i32 1036536393, ; 156: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1048992957, ; 158: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 188
	i32 1052210849, ; 159: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 253
	i32 1067306892, ; 160: GoogleGson => 0x3f9dcf8c => 172
	i32 1082857460, ; 161: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 162: Xamarin.Kotlin.StdLib => 0x409e66d8 => 287
	i32 1098259244, ; 163: System => 0x41761b2c => 163
	i32 1106973742, ; 164: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 183
	i32 1118262833, ; 165: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 309
	i32 1121599056, ; 166: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 252
	i32 1127624469, ; 167: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 197
	i32 1149092582, ; 168: Xamarin.AndroidX.Window => 0x447dc2e6 => 279
	i32 1168523401, ; 169: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 315
	i32 1170634674, ; 170: System.Web.dll => 0x45c677b2 => 152
	i32 1173126369, ; 171: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 189
	i32 1175144683, ; 172: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 275
	i32 1178241025, ; 173: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 260
	i32 1203215381, ; 174: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 313
	i32 1204270330, ; 175: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 221
	i32 1208641965, ; 176: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1219128291, ; 177: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 178: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 311
	i32 1243150071, ; 179: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 280
	i32 1253011324, ; 180: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 181: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 295
	i32 1264511973, ; 182: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 270
	i32 1267360935, ; 183: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 274
	i32 1273260888, ; 184: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 226
	i32 1275534314, ; 185: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 291
	i32 1278448581, ; 186: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 218
	i32 1293217323, ; 187: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 237
	i32 1309188875, ; 188: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1322716291, ; 189: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 279
	i32 1324164729, ; 190: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 191: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 192: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 193: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 325
	i32 1376866003, ; 194: Xamarin.AndroidX.SavedState => 0x52114ed3 => 266
	i32 1379779777, ; 195: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1402170036, ; 196: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 197: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 230
	i32 1408764838, ; 198: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 199: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 200: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 201: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 293
	i32 1434145427, ; 202: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 203: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 283
	i32 1439761251, ; 204: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 205: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 206: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1454105418, ; 207: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 190
	i32 1457743152, ; 208: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 209: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 210: es\Microsoft.Maui.Controls.resources => 0x57152abe => 299
	i32 1461234159, ; 211: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 212: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 213: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 214: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 220
	i32 1470490898, ; 215: Microsoft.Extensions.Primitives => 0x57a5e912 => 200
	i32 1479771757, ; 216: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 217: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 218: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 219: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 267
	i32 1493001747, ; 220: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 303
	i32 1505131794, ; 221: Microsoft.Extensions.Http => 0x59b67d12 => 194
	i32 1514721132, ; 222: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 298
	i32 1521091094, ; 223: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 193
	i32 1536373174, ; 224: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 225: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 137
	i32 1543355203, ; 226: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1546581739, ; 227: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 178
	i32 1550322496, ; 228: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 229: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 318
	i32 1565862583, ; 230: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 231: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 140
	i32 1573704789, ; 232: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 233: System.Threading.Overlapped => 0x5e2d7514 => 139
	i32 1582372066, ; 234: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 236
	i32 1592978981, ; 235: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 236: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 284
	i32 1601112923, ; 237: System.Xml.Serialization => 0x5f6f0b5b => 156
	i32 1604827217, ; 238: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 239: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 240: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 256
	i32 1622358360, ; 241: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 242: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 278
	i32 1632842087, ; 243: Microsoft.Extensions.Configuration.Json => 0x61533167 => 184
	i32 1635184631, ; 244: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 240
	i32 1636350590, ; 245: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 233
	i32 1639515021, ; 246: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 247: System.Text.RegularExpressions => 0x61c036ca => 137
	i32 1641389582, ; 248: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 249: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 177
	i32 1657153582, ; 250: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 251: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 272
	i32 1658251792, ; 252: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 281
	i32 1670060433, ; 253: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 228
	i32 1675553242, ; 254: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 255: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 256: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 257: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1691477237, ; 258: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 259: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 260: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 288
	i32 1701541528, ; 261: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 262: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 249
	i32 1726116996, ; 263: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 264: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 265: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 224
	i32 1736233607, ; 266: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 316
	i32 1743415430, ; 267: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 294
	i32 1744735666, ; 268: System.Transactions.Local.dll => 0x67fe8db2 => 148
	i32 1746115085, ; 269: System.IO.Pipelines.dll => 0x68139a0d => 209
	i32 1746316138, ; 270: Mono.Android.Export => 0x6816ab6a => 168
	i32 1750313021, ; 271: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 272: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1760259689, ; 273: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 176
	i32 1763938596, ; 274: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 275: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 276: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 271
	i32 1770582343, ; 277: Microsoft.Extensions.Logging.dll => 0x6988f147 => 195
	i32 1776026572, ; 278: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 279: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 280: Mono.Android.Runtime.dll => 0x6a216153 => 169
	i32 1782862114, ; 281: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 310
	i32 1788241197, ; 282: Xamarin.AndroidX.Fragment => 0x6a96652d => 242
	i32 1793755602, ; 283: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 302
	i32 1808609942, ; 284: Xamarin.AndroidX.Loader => 0x6bcd3296 => 256
	i32 1813058853, ; 285: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 287
	i32 1813201214, ; 286: Xamarin.Google.Android.Material => 0x6c13413e => 281
	i32 1818569960, ; 287: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 261
	i32 1818787751, ; 288: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 289: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 290: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 291: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 196
	i32 1842015223, ; 292: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 322
	i32 1847515442, ; 293: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 211
	i32 1853025655, ; 294: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 319
	i32 1858542181, ; 295: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 296: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 297: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 301
	i32 1879696579, ; 298: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 299: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 222
	i32 1888955245, ; 300: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 301: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 302: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 303: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 304: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 305: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1956758971, ; 306: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 307: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 268
	i32 1968388702, ; 308: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 180
	i32 1983156543, ; 309: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 288
	i32 1985761444, ; 310: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 213
	i32 2003115576, ; 311: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 298
	i32 2011961780, ; 312: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 313: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 253
	i32 2025202353, ; 314: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 293
	i32 2031763787, ; 315: Xamarin.Android.Glide => 0x791a414b => 210
	i32 2045470958, ; 316: System.Private.Xml => 0x79eb68ee => 87
	i32 2048278909, ; 317: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 182
	i32 2055257422, ; 318: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 248
	i32 2060060697, ; 319: System.Windows.dll => 0x7aca0819 => 153
	i32 2066184531, ; 320: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 297
	i32 2070888862, ; 321: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2072397586, ; 322: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 192
	i32 2079903147, ; 323: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 324: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2127167465, ; 325: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 326: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 327: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 161
	i32 2146852085, ; 328: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 329: Microsoft.Maui => 0x80bd55ad => 205
	i32 2169148018, ; 330: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 305
	i32 2181898931, ; 331: Microsoft.Extensions.Options.dll => 0x820d22b3 => 198
	i32 2192057212, ; 332: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 196
	i32 2193016926, ; 333: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2201107256, ; 334: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 292
	i32 2201231467, ; 335: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 336: it\Microsoft.Maui.Controls.resources => 0x839595db => 307
	i32 2217644978, ; 337: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 275
	i32 2222056684, ; 338: System.Threading.Tasks.Parallel => 0x8471e4ec => 142
	i32 2244775296, ; 339: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 257
	i32 2252106437, ; 340: System.Xml.Serialization.dll => 0x863c6ac5 => 156
	i32 2256313426, ; 341: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 342: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 343: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 181
	i32 2267999099, ; 344: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 212
	i32 2270573516, ; 345: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 301
	i32 2279755925, ; 346: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 264
	i32 2293034957, ; 347: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 348: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 349: System.Net.Mail => 0x88ffe49e => 65
	i32 2303942373, ; 350: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 311
	i32 2305521784, ; 351: System.Private.CoreLib.dll => 0x896b7878 => 171
	i32 2315684594, ; 352: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 216
	i32 2320631194, ; 353: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 142
	i32 2340441535, ; 354: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 355: System.ValueTuple => 0x8bbaa2cd => 150
	i32 2353062107, ; 356: System.Net.Primitives => 0x8c40e0db => 69
	i32 2368005991, ; 357: System.Xml.ReaderWriter.dll => 0x8d24e767 => 155
	i32 2371007202, ; 358: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 180
	i32 2378619854, ; 359: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 360: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2384068465, ; 361: CryptoTracker.App => 0x8e19ff71 => 0
	i32 2395872292, ; 362: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 306
	i32 2401565422, ; 363: System.Web.HttpUtility => 0x8f24faee => 151
	i32 2403014039, ; 364: CryptoTracker.App.dll => 0x8f3b1597 => 0
	i32 2403452196, ; 365: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 239
	i32 2411328690, ; 366: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 174
	i32 2421380589, ; 367: System.Threading.Tasks.Dataflow => 0x905355ed => 140
	i32 2423080555, ; 368: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 226
	i32 2427813419, ; 369: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 303
	i32 2435356389, ; 370: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 371: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 372: Microsoft.JSInterop.dll => 0x919672ca => 201
	i32 2454642406, ; 373: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 374: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 375: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 376: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 229
	i32 2471841756, ; 377: netstandard.dll => 0x93554fdc => 166
	i32 2475788418, ; 378: Java.Interop.dll => 0x93918882 => 167
	i32 2480646305, ; 379: Microsoft.Maui.Controls => 0x93dba8a1 => 203
	i32 2483903535, ; 380: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 381: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 382: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 383: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 384: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 251
	i32 2522472828, ; 385: Xamarin.Android.Glide.dll => 0x9659e17c => 210
	i32 2537015816, ; 386: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 173
	i32 2538310050, ; 387: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 388: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 304
	i32 2562349572, ; 389: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 390: System.Text.Encodings.Web => 0x9930ee42 => 135
	i32 2581783588, ; 391: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 252
	i32 2581819634, ; 392: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 274
	i32 2585220780, ; 393: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 394: System.Net.Ping => 0x9a20430d => 68
	i32 2585813321, ; 395: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 175
	i32 2589602615, ; 396: System.Threading.ThreadPool => 0x9a5a3337 => 145
	i32 2592341985, ; 397: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 189
	i32 2593496499, ; 398: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 313
	i32 2605712449, ; 399: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 292
	i32 2615233544, ; 400: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 243
	i32 2616218305, ; 401: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 197
	i32 2617129537, ; 402: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 403: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 404: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 233
	i32 2624644809, ; 405: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 238
	i32 2626831493, ; 406: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 308
	i32 2627185994, ; 407: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 408: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 409: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 247
	i32 2663391936, ; 410: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 212
	i32 2663698177, ; 411: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 412: System.Xml.XDocument.dll => 0x9ecf752a => 157
	i32 2665622720, ; 413: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 414: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 415: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2692077919, ; 416: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 177
	i32 2693849962, ; 417: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 418: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 272
	i32 2715334215, ; 419: System.Threading.Tasks.dll => 0xa1d8b647 => 143
	i32 2717744543, ; 420: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 421: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 422: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 423: Xamarin.AndroidX.Activity => 0xa2e0939b => 214
	i32 2735172069, ; 424: System.Threading.Channels => 0xa30769e5 => 138
	i32 2735631878, ; 425: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 173
	i32 2737747696, ; 426: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 220
	i32 2740948882, ; 427: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 428: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 429: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 314
	i32 2758225723, ; 430: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 204
	i32 2764765095, ; 431: Microsoft.Maui.dll => 0xa4caf7a7 => 205
	i32 2765824710, ; 432: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 433: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 286
	i32 2778768386, ; 434: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 277
	i32 2779977773, ; 435: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 265
	i32 2785988530, ; 436: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 320
	i32 2788224221, ; 437: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 243
	i32 2801831435, ; 438: Microsoft.Maui.Graphics => 0xa7008e0b => 207
	i32 2803228030, ; 439: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 158
	i32 2806116107, ; 440: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 299
	i32 2810250172, ; 441: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 230
	i32 2819470561, ; 442: System.Xml.dll => 0xa80db4e1 => 162
	i32 2821205001, ; 443: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 444: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 265
	i32 2824502124, ; 445: System.Xml.XmlDocument => 0xa85a7b6c => 160
	i32 2831556043, ; 446: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 312
	i32 2833784645, ; 447: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 179
	i32 2838993487, ; 448: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 254
	i32 2849599387, ; 449: System.Threading.Overlapped.dll => 0xa9d96f9b => 139
	i32 2853208004, ; 450: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 277
	i32 2855708567, ; 451: Xamarin.AndroidX.Transition => 0xaa36a797 => 273
	i32 2861098320, ; 452: Mono.Android.Export.dll => 0xaa88e550 => 168
	i32 2861189240, ; 453: Microsoft.Maui.Essentials => 0xaa8a4878 => 206
	i32 2870099610, ; 454: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 215
	i32 2875164099, ; 455: Jsr305Binding.dll => 0xab5f85c3 => 282
	i32 2875220617, ; 456: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 457: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 241
	i32 2887636118, ; 458: System.Net.dll => 0xac1dd496 => 80
	i32 2892341533, ; 459: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 176
	i32 2899753641, ; 460: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 461: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 462: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 463: mscorlib.dll => 0xad2a79b6 => 165
	i32 2909740682, ; 464: System.Private.CoreLib => 0xad6f1e8a => 171
	i32 2911054922, ; 465: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 192
	i32 2916838712, ; 466: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 278
	i32 2919462931, ; 467: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 468: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 217
	i32 2936416060, ; 469: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 470: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 471: System.Xml.XPath.XDocument => 0xaf624531 => 158
	i32 2959614098, ; 472: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 473: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2971004615, ; 474: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 199
	i32 2972252294, ; 475: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 476: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 237
	i32 2987532451, ; 477: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 268
	i32 2996846495, ; 478: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 250
	i32 3016983068, ; 479: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 270
	i32 3020703001, ; 480: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 187
	i32 3023353419, ; 481: WindowsBase.dll => 0xb434b64b => 164
	i32 3024354802, ; 482: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 245
	i32 3038032645, ; 483: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 328
	i32 3045002322, ; 484: CryptoTracker.sdk.dll => 0xb57f0c52 => 327
	i32 3056245963, ; 485: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 267
	i32 3057625584, ; 486: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 258
	i32 3059408633, ; 487: Mono.Android.Runtime => 0xb65adef9 => 169
	i32 3059793426, ; 488: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 489: System.Threading.Tasks => 0xb755818f => 143
	i32 3077302341, ; 490: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 305
	i32 3090735792, ; 491: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 492: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 493: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 494: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 495: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 496: System.Threading.Tasks.Extensions => 0xba4127cb => 141
	i32 3132293585, ; 497: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3147165239, ; 498: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 499: GoogleGson.dll => 0xbba64c02 => 172
	i32 3159123045, ; 500: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 501: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 502: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 259
	i32 3192346100, ; 503: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 504: System.Web => 0xbe592c0c => 152
	i32 3204380047, ; 505: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 506: System.Xml.XmlDocument.dll => 0xbf506931 => 160
	i32 3211777861, ; 507: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 236
	i32 3220365878, ; 508: System.Threading => 0xbff2e236 => 147
	i32 3226221578, ; 509: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 510: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 511: Xamarin.AndroidX.CardView => 0xc235e84d => 224
	i32 3265493905, ; 512: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 513: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 141
	i32 3277815716, ; 514: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 515: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 516: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 517: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 518: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 519: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 520: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 300
	i32 3316684772, ; 521: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 522: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 234
	i32 3317144872, ; 523: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 524: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 222
	i32 3345895724, ; 525: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 263
	i32 3346324047, ; 526: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 260
	i32 3357674450, ; 527: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 317
	i32 3358260929, ; 528: System.Text.Json => 0xc82afec1 => 136
	i32 3362336904, ; 529: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 215
	i32 3362522851, ; 530: Xamarin.AndroidX.Core => 0xc86c06e3 => 231
	i32 3366347497, ; 531: Java.Interop => 0xc8a662e9 => 167
	i32 3374999561, ; 532: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 264
	i32 3381016424, ; 533: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 296
	i32 3395150330, ; 534: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 535: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 536: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 235
	i32 3406629867, ; 537: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 190
	i32 3421170118, ; 538: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 182
	i32 3428513518, ; 539: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 185
	i32 3429136800, ; 540: System.Xml => 0xcc6479a0 => 162
	i32 3430777524, ; 541: netstandard => 0xcc7d82b4 => 166
	i32 3441283291, ; 542: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 238
	i32 3445260447, ; 543: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 544: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 202
	i32 3463511458, ; 545: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 304
	i32 3464190856, ; 546: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 175
	i32 3471940407, ; 547: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 548: Mono.Android => 0xcf3163e6 => 170
	i32 3479583265, ; 549: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 317
	i32 3484440000, ; 550: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 316
	i32 3485117614, ; 551: System.Text.Json.dll => 0xcfbaacae => 136
	i32 3486566296, ; 552: System.Transactions => 0xcfd0c798 => 149
	i32 3493954962, ; 553: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 227
	i32 3500000672, ; 554: Microsoft.JSInterop => 0xd09dc5a0 => 201
	i32 3509114376, ; 555: System.Xml.Linq => 0xd128d608 => 154
	i32 3515174580, ; 556: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 557: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 558: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 559: System.Threading.Timer => 0xd432d20b => 146
	i32 3570554715, ; 560: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 561: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 324
	i32 3597029428, ; 562: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 213
	i32 3598340787, ; 563: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 564: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 565: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 566: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 262
	i32 3633644679, ; 567: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 217
	i32 3638274909, ; 568: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 569: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 248
	i32 3643446276, ; 570: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 321
	i32 3643854240, ; 571: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 259
	i32 3645089577, ; 572: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 573: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 181
	i32 3660523487, ; 574: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 575: Mono.Android.dll => 0xdae8aa5e => 170
	i32 3682565725, ; 576: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 223
	i32 3684561358, ; 577: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 227
	i32 3697841164, ; 578: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 326
	i32 3700866549, ; 579: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 580: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 232
	i32 3716563718, ; 581: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 582: Xamarin.AndroidX.Annotation => 0xdda814c6 => 216
	i32 3722202641, ; 583: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 184
	i32 3724971120, ; 584: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 258
	i32 3732100267, ; 585: System.Net.NameResolution => 0xde7354ab => 66
	i32 3732214720, ; 586: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 179
	i32 3737834244, ; 587: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 588: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 208
	i32 3751444290, ; 589: System.Xml.XPath => 0xdf9a7f42 => 159
	i32 3758424670, ; 590: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 183
	i32 3786282454, ; 591: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 225
	i32 3792276235, ; 592: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 593: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 202
	i32 3802395368, ; 594: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 595: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 596: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 597: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 598: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 186
	i32 3844307129, ; 599: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 600: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 601: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 602: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 603: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 604: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 605: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 273
	i32 3888767677, ; 606: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 263
	i32 3889960447, ; 607: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 325
	i32 3896106733, ; 608: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 609: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 231
	i32 3901907137, ; 610: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 611: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 612: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 276
	i32 3928044579, ; 613: System.Xml.ReaderWriter => 0xea213423 => 155
	i32 3930554604, ; 614: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 615: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 261
	i32 3945713374, ; 616: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 617: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 618: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 219
	i32 3959773229, ; 619: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 250
	i32 3980434154, ; 620: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 320
	i32 3987592930, ; 621: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 302
	i32 4003436829, ; 622: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 623: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 218
	i32 4023392905, ; 624: System.IO.Pipelines => 0xefd01a89 => 209
	i32 4025784931, ; 625: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 626: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 204
	i32 4054681211, ; 627: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 628: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 629: System.Threading.dll => 0xf2ce3c98 => 147
	i32 4094352644, ; 630: Microsoft.Maui.Essentials.dll => 0xf40add04 => 206
	i32 4099507663, ; 631: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 632: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 633: Xamarin.AndroidX.Emoji2 => 0xf479582c => 239
	i32 4102112229, ; 634: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 315
	i32 4125707920, ; 635: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 310
	i32 4126470640, ; 636: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 185
	i32 4127667938, ; 637: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 638: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 639: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 640: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 322
	i32 4151237749, ; 641: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 642: System.Xml.XmlSerializer => 0xf7e95c85 => 161
	i32 4161255271, ; 643: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 644: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 645: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 646: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 255
	i32 4185676441, ; 647: System.Security => 0xf97c5a99 => 129
	i32 4196529839, ; 648: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 649: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 208
	i32 4256097574, ; 650: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 232
	i32 4258378803, ; 651: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 254
	i32 4260525087, ; 652: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 653: Microsoft.Maui.Controls.dll => 0xfea12dee => 203
	i32 4274976490, ; 654: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 655: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 255
	i32 4294648842, ; 656: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 191
	i32 4294763496 ; 657: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 241
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [658 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 251, ; 3
	i32 285, ; 4
	i32 47, ; 5
	i32 79, ; 6
	i32 144, ; 7
	i32 29, ; 8
	i32 326, ; 9
	i32 123, ; 10
	i32 207, ; 11
	i32 101, ; 12
	i32 188, ; 13
	i32 269, ; 14
	i32 106, ; 15
	i32 269, ; 16
	i32 138, ; 17
	i32 289, ; 18
	i32 76, ; 19
	i32 123, ; 20
	i32 13, ; 21
	i32 225, ; 22
	i32 131, ; 23
	i32 271, ; 24
	i32 150, ; 25
	i32 323, ; 26
	i32 324, ; 27
	i32 18, ; 28
	i32 223, ; 29
	i32 26, ; 30
	i32 187, ; 31
	i32 245, ; 32
	i32 1, ; 33
	i32 58, ; 34
	i32 41, ; 35
	i32 90, ; 36
	i32 174, ; 37
	i32 228, ; 38
	i32 146, ; 39
	i32 247, ; 40
	i32 244, ; 41
	i32 295, ; 42
	i32 53, ; 43
	i32 194, ; 44
	i32 68, ; 45
	i32 323, ; 46
	i32 214, ; 47
	i32 82, ; 48
	i32 308, ; 49
	i32 246, ; 50
	i32 307, ; 51
	i32 130, ; 52
	i32 54, ; 53
	i32 148, ; 54
	i32 73, ; 55
	i32 144, ; 56
	i32 61, ; 57
	i32 145, ; 58
	i32 328, ; 59
	i32 164, ; 60
	i32 319, ; 61
	i32 229, ; 62
	i32 12, ; 63
	i32 242, ; 64
	i32 124, ; 65
	i32 151, ; 66
	i32 112, ; 67
	i32 165, ; 68
	i32 163, ; 69
	i32 244, ; 70
	i32 257, ; 71
	i32 327, ; 72
	i32 83, ; 73
	i32 306, ; 74
	i32 300, ; 75
	i32 200, ; 76
	i32 149, ; 77
	i32 289, ; 78
	i32 59, ; 79
	i32 195, ; 80
	i32 50, ; 81
	i32 102, ; 82
	i32 113, ; 83
	i32 39, ; 84
	i32 282, ; 85
	i32 280, ; 86
	i32 191, ; 87
	i32 119, ; 88
	i32 314, ; 89
	i32 51, ; 90
	i32 43, ; 91
	i32 118, ; 92
	i32 234, ; 93
	i32 312, ; 94
	i32 240, ; 95
	i32 80, ; 96
	i32 135, ; 97
	i32 276, ; 98
	i32 221, ; 99
	i32 8, ; 100
	i32 72, ; 101
	i32 294, ; 102
	i32 154, ; 103
	i32 291, ; 104
	i32 153, ; 105
	i32 91, ; 106
	i32 286, ; 107
	i32 44, ; 108
	i32 309, ; 109
	i32 297, ; 110
	i32 290, ; 111
	i32 108, ; 112
	i32 199, ; 113
	i32 128, ; 114
	i32 25, ; 115
	i32 211, ; 116
	i32 71, ; 117
	i32 54, ; 118
	i32 45, ; 119
	i32 318, ; 120
	i32 198, ; 121
	i32 235, ; 122
	i32 178, ; 123
	i32 22, ; 124
	i32 249, ; 125
	i32 85, ; 126
	i32 42, ; 127
	i32 159, ; 128
	i32 70, ; 129
	i32 262, ; 130
	i32 3, ; 131
	i32 41, ; 132
	i32 62, ; 133
	i32 16, ; 134
	i32 52, ; 135
	i32 321, ; 136
	i32 285, ; 137
	i32 104, ; 138
	i32 290, ; 139
	i32 283, ; 140
	i32 246, ; 141
	i32 33, ; 142
	i32 157, ; 143
	i32 84, ; 144
	i32 31, ; 145
	i32 12, ; 146
	i32 50, ; 147
	i32 193, ; 148
	i32 55, ; 149
	i32 266, ; 150
	i32 35, ; 151
	i32 186, ; 152
	i32 296, ; 153
	i32 284, ; 154
	i32 219, ; 155
	i32 34, ; 156
	i32 57, ; 157
	i32 188, ; 158
	i32 253, ; 159
	i32 172, ; 160
	i32 17, ; 161
	i32 287, ; 162
	i32 163, ; 163
	i32 183, ; 164
	i32 309, ; 165
	i32 252, ; 166
	i32 197, ; 167
	i32 279, ; 168
	i32 315, ; 169
	i32 152, ; 170
	i32 189, ; 171
	i32 275, ; 172
	i32 260, ; 173
	i32 313, ; 174
	i32 221, ; 175
	i32 28, ; 176
	i32 51, ; 177
	i32 311, ; 178
	i32 280, ; 179
	i32 5, ; 180
	i32 295, ; 181
	i32 270, ; 182
	i32 274, ; 183
	i32 226, ; 184
	i32 291, ; 185
	i32 218, ; 186
	i32 237, ; 187
	i32 84, ; 188
	i32 279, ; 189
	i32 60, ; 190
	i32 111, ; 191
	i32 56, ; 192
	i32 325, ; 193
	i32 266, ; 194
	i32 98, ; 195
	i32 19, ; 196
	i32 230, ; 197
	i32 110, ; 198
	i32 100, ; 199
	i32 101, ; 200
	i32 293, ; 201
	i32 103, ; 202
	i32 283, ; 203
	i32 70, ; 204
	i32 37, ; 205
	i32 31, ; 206
	i32 190, ; 207
	i32 102, ; 208
	i32 72, ; 209
	i32 299, ; 210
	i32 9, ; 211
	i32 122, ; 212
	i32 45, ; 213
	i32 220, ; 214
	i32 200, ; 215
	i32 9, ; 216
	i32 42, ; 217
	i32 4, ; 218
	i32 267, ; 219
	i32 303, ; 220
	i32 194, ; 221
	i32 298, ; 222
	i32 193, ; 223
	i32 30, ; 224
	i32 137, ; 225
	i32 91, ; 226
	i32 178, ; 227
	i32 92, ; 228
	i32 318, ; 229
	i32 48, ; 230
	i32 140, ; 231
	i32 111, ; 232
	i32 139, ; 233
	i32 236, ; 234
	i32 114, ; 235
	i32 284, ; 236
	i32 156, ; 237
	i32 75, ; 238
	i32 78, ; 239
	i32 256, ; 240
	i32 36, ; 241
	i32 278, ; 242
	i32 184, ; 243
	i32 240, ; 244
	i32 233, ; 245
	i32 63, ; 246
	i32 137, ; 247
	i32 15, ; 248
	i32 177, ; 249
	i32 115, ; 250
	i32 272, ; 251
	i32 281, ; 252
	i32 228, ; 253
	i32 47, ; 254
	i32 69, ; 255
	i32 79, ; 256
	i32 125, ; 257
	i32 93, ; 258
	i32 120, ; 259
	i32 288, ; 260
	i32 26, ; 261
	i32 249, ; 262
	i32 96, ; 263
	i32 27, ; 264
	i32 224, ; 265
	i32 316, ; 266
	i32 294, ; 267
	i32 148, ; 268
	i32 209, ; 269
	i32 168, ; 270
	i32 4, ; 271
	i32 97, ; 272
	i32 176, ; 273
	i32 32, ; 274
	i32 92, ; 275
	i32 271, ; 276
	i32 195, ; 277
	i32 21, ; 278
	i32 40, ; 279
	i32 169, ; 280
	i32 310, ; 281
	i32 242, ; 282
	i32 302, ; 283
	i32 256, ; 284
	i32 287, ; 285
	i32 281, ; 286
	i32 261, ; 287
	i32 2, ; 288
	i32 133, ; 289
	i32 110, ; 290
	i32 196, ; 291
	i32 322, ; 292
	i32 211, ; 293
	i32 319, ; 294
	i32 57, ; 295
	i32 94, ; 296
	i32 301, ; 297
	i32 38, ; 298
	i32 222, ; 299
	i32 25, ; 300
	i32 93, ; 301
	i32 88, ; 302
	i32 98, ; 303
	i32 10, ; 304
	i32 86, ; 305
	i32 99, ; 306
	i32 268, ; 307
	i32 180, ; 308
	i32 288, ; 309
	i32 213, ; 310
	i32 298, ; 311
	i32 7, ; 312
	i32 253, ; 313
	i32 293, ; 314
	i32 210, ; 315
	i32 87, ; 316
	i32 182, ; 317
	i32 248, ; 318
	i32 153, ; 319
	i32 297, ; 320
	i32 32, ; 321
	i32 192, ; 322
	i32 115, ; 323
	i32 81, ; 324
	i32 20, ; 325
	i32 11, ; 326
	i32 161, ; 327
	i32 3, ; 328
	i32 205, ; 329
	i32 305, ; 330
	i32 198, ; 331
	i32 196, ; 332
	i32 83, ; 333
	i32 292, ; 334
	i32 63, ; 335
	i32 307, ; 336
	i32 275, ; 337
	i32 142, ; 338
	i32 257, ; 339
	i32 156, ; 340
	i32 40, ; 341
	i32 116, ; 342
	i32 181, ; 343
	i32 212, ; 344
	i32 301, ; 345
	i32 264, ; 346
	i32 130, ; 347
	i32 74, ; 348
	i32 65, ; 349
	i32 311, ; 350
	i32 171, ; 351
	i32 216, ; 352
	i32 142, ; 353
	i32 105, ; 354
	i32 150, ; 355
	i32 69, ; 356
	i32 155, ; 357
	i32 180, ; 358
	i32 120, ; 359
	i32 126, ; 360
	i32 0, ; 361
	i32 306, ; 362
	i32 151, ; 363
	i32 0, ; 364
	i32 239, ; 365
	i32 174, ; 366
	i32 140, ; 367
	i32 226, ; 368
	i32 303, ; 369
	i32 20, ; 370
	i32 14, ; 371
	i32 201, ; 372
	i32 134, ; 373
	i32 74, ; 374
	i32 58, ; 375
	i32 229, ; 376
	i32 166, ; 377
	i32 167, ; 378
	i32 203, ; 379
	i32 15, ; 380
	i32 73, ; 381
	i32 6, ; 382
	i32 23, ; 383
	i32 251, ; 384
	i32 210, ; 385
	i32 173, ; 386
	i32 90, ; 387
	i32 304, ; 388
	i32 1, ; 389
	i32 135, ; 390
	i32 252, ; 391
	i32 274, ; 392
	i32 133, ; 393
	i32 68, ; 394
	i32 175, ; 395
	i32 145, ; 396
	i32 189, ; 397
	i32 313, ; 398
	i32 292, ; 399
	i32 243, ; 400
	i32 197, ; 401
	i32 87, ; 402
	i32 95, ; 403
	i32 233, ; 404
	i32 238, ; 405
	i32 308, ; 406
	i32 30, ; 407
	i32 44, ; 408
	i32 247, ; 409
	i32 212, ; 410
	i32 108, ; 411
	i32 157, ; 412
	i32 34, ; 413
	i32 22, ; 414
	i32 113, ; 415
	i32 177, ; 416
	i32 56, ; 417
	i32 272, ; 418
	i32 143, ; 419
	i32 117, ; 420
	i32 119, ; 421
	i32 109, ; 422
	i32 214, ; 423
	i32 138, ; 424
	i32 173, ; 425
	i32 220, ; 426
	i32 53, ; 427
	i32 104, ; 428
	i32 314, ; 429
	i32 204, ; 430
	i32 205, ; 431
	i32 132, ; 432
	i32 286, ; 433
	i32 277, ; 434
	i32 265, ; 435
	i32 320, ; 436
	i32 243, ; 437
	i32 207, ; 438
	i32 158, ; 439
	i32 299, ; 440
	i32 230, ; 441
	i32 162, ; 442
	i32 131, ; 443
	i32 265, ; 444
	i32 160, ; 445
	i32 312, ; 446
	i32 179, ; 447
	i32 254, ; 448
	i32 139, ; 449
	i32 277, ; 450
	i32 273, ; 451
	i32 168, ; 452
	i32 206, ; 453
	i32 215, ; 454
	i32 282, ; 455
	i32 39, ; 456
	i32 241, ; 457
	i32 80, ; 458
	i32 176, ; 459
	i32 55, ; 460
	i32 36, ; 461
	i32 96, ; 462
	i32 165, ; 463
	i32 171, ; 464
	i32 192, ; 465
	i32 278, ; 466
	i32 81, ; 467
	i32 217, ; 468
	i32 97, ; 469
	i32 29, ; 470
	i32 158, ; 471
	i32 18, ; 472
	i32 126, ; 473
	i32 199, ; 474
	i32 118, ; 475
	i32 237, ; 476
	i32 268, ; 477
	i32 250, ; 478
	i32 270, ; 479
	i32 187, ; 480
	i32 164, ; 481
	i32 245, ; 482
	i32 328, ; 483
	i32 327, ; 484
	i32 267, ; 485
	i32 258, ; 486
	i32 169, ; 487
	i32 16, ; 488
	i32 143, ; 489
	i32 305, ; 490
	i32 124, ; 491
	i32 117, ; 492
	i32 37, ; 493
	i32 114, ; 494
	i32 46, ; 495
	i32 141, ; 496
	i32 116, ; 497
	i32 33, ; 498
	i32 172, ; 499
	i32 94, ; 500
	i32 52, ; 501
	i32 259, ; 502
	i32 128, ; 503
	i32 152, ; 504
	i32 24, ; 505
	i32 160, ; 506
	i32 236, ; 507
	i32 147, ; 508
	i32 103, ; 509
	i32 88, ; 510
	i32 224, ; 511
	i32 59, ; 512
	i32 141, ; 513
	i32 99, ; 514
	i32 5, ; 515
	i32 13, ; 516
	i32 121, ; 517
	i32 134, ; 518
	i32 27, ; 519
	i32 300, ; 520
	i32 71, ; 521
	i32 234, ; 522
	i32 24, ; 523
	i32 222, ; 524
	i32 263, ; 525
	i32 260, ; 526
	i32 317, ; 527
	i32 136, ; 528
	i32 215, ; 529
	i32 231, ; 530
	i32 167, ; 531
	i32 264, ; 532
	i32 296, ; 533
	i32 100, ; 534
	i32 122, ; 535
	i32 235, ; 536
	i32 190, ; 537
	i32 182, ; 538
	i32 185, ; 539
	i32 162, ; 540
	i32 166, ; 541
	i32 238, ; 542
	i32 38, ; 543
	i32 202, ; 544
	i32 304, ; 545
	i32 175, ; 546
	i32 17, ; 547
	i32 170, ; 548
	i32 317, ; 549
	i32 316, ; 550
	i32 136, ; 551
	i32 149, ; 552
	i32 227, ; 553
	i32 201, ; 554
	i32 154, ; 555
	i32 129, ; 556
	i32 19, ; 557
	i32 64, ; 558
	i32 146, ; 559
	i32 46, ; 560
	i32 324, ; 561
	i32 213, ; 562
	i32 78, ; 563
	i32 60, ; 564
	i32 105, ; 565
	i32 262, ; 566
	i32 217, ; 567
	i32 48, ; 568
	i32 248, ; 569
	i32 321, ; 570
	i32 259, ; 571
	i32 14, ; 572
	i32 181, ; 573
	i32 67, ; 574
	i32 170, ; 575
	i32 223, ; 576
	i32 227, ; 577
	i32 326, ; 578
	i32 77, ; 579
	i32 232, ; 580
	i32 107, ; 581
	i32 216, ; 582
	i32 184, ; 583
	i32 258, ; 584
	i32 66, ; 585
	i32 179, ; 586
	i32 62, ; 587
	i32 208, ; 588
	i32 159, ; 589
	i32 183, ; 590
	i32 225, ; 591
	i32 10, ; 592
	i32 202, ; 593
	i32 11, ; 594
	i32 77, ; 595
	i32 125, ; 596
	i32 82, ; 597
	i32 186, ; 598
	i32 65, ; 599
	i32 106, ; 600
	i32 64, ; 601
	i32 127, ; 602
	i32 121, ; 603
	i32 76, ; 604
	i32 273, ; 605
	i32 263, ; 606
	i32 325, ; 607
	i32 8, ; 608
	i32 231, ; 609
	i32 2, ; 610
	i32 43, ; 611
	i32 276, ; 612
	i32 155, ; 613
	i32 127, ; 614
	i32 261, ; 615
	i32 23, ; 616
	i32 132, ; 617
	i32 219, ; 618
	i32 250, ; 619
	i32 320, ; 620
	i32 302, ; 621
	i32 28, ; 622
	i32 218, ; 623
	i32 209, ; 624
	i32 61, ; 625
	i32 204, ; 626
	i32 89, ; 627
	i32 86, ; 628
	i32 147, ; 629
	i32 206, ; 630
	i32 35, ; 631
	i32 85, ; 632
	i32 239, ; 633
	i32 315, ; 634
	i32 310, ; 635
	i32 185, ; 636
	i32 49, ; 637
	i32 6, ; 638
	i32 89, ; 639
	i32 322, ; 640
	i32 21, ; 641
	i32 161, ; 642
	i32 95, ; 643
	i32 49, ; 644
	i32 112, ; 645
	i32 255, ; 646
	i32 129, ; 647
	i32 75, ; 648
	i32 208, ; 649
	i32 232, ; 650
	i32 254, ; 651
	i32 7, ; 652
	i32 203, ; 653
	i32 109, ; 654
	i32 255, ; 655
	i32 191, ; 656
	i32 241 ; 657
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
