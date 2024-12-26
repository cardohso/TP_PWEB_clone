; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [374 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [742 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 290
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 325
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 58571260, ; 8: RCLComum => 0x37db9fc => 368
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 366
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 237
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83768722, ; 14: Microsoft.AspNetCore.Cryptography.Internal => 0x4fe3592 => 192
	i32 101534019, ; 15: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 308
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 308
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 329
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 144068927, ; 21: RCLComum.dll => 0x896513f => 368
	i32 149972175, ; 22: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 23: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 24: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 264
	i32 176265551, ; 25: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 26: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 204
	i32 182336117, ; 27: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 310
	i32 184328833, ; 28: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 29: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 363
	i32 199333315, ; 30: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 364
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 262
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 229118224, ; 34: Microsoft.AspNetCore.Identity => 0xda81110 => 202
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 284
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 244348769, ; 39: Microsoft.AspNetCore.Components.Authorization => 0xe907761 => 186
	i32 246610117, ; 40: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 41: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 185
	i32 261689757, ; 42: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 267
	i32 261882112, ; 43: DocumentFormat.OpenXml.Framework.dll => 0xf9c0100 => 174
	i32 276479776, ; 44: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 45: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 286
	i32 280482487, ; 46: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 283
	i32 280992041, ; 47: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 335
	i32 291076382, ; 48: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 49: System.Net.Ping.dll => 0x11d123fd => 69
	i32 300686228, ; 50: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0x11ec1b94 => 181
	i32 317674968, ; 51: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 363
	i32 318968648, ; 52: Xamarin.AndroidX.Activity.dll => 0x13031348 => 253
	i32 321597661, ; 53: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 54: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 348
	i32 342366114, ; 55: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 285
	i32 347068432, ; 56: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 242
	i32 356389973, ; 57: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 347
	i32 360082299, ; 58: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 59: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 60: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 61: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 62: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 63: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 64: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 65: _Microsoft.Android.Resource.Designer => 0x17969339 => 370
	i32 403441872, ; 66: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 67: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 359
	i32 441335492, ; 68: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 268
	i32 442521989, ; 69: Xamarin.Essentials => 0x1a605985 => 320
	i32 442565967, ; 70: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 71: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 281
	i32 451504562, ; 72: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 73: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 74: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 75: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 76: System.dll => 0x1bff388e => 164
	i32 476646585, ; 77: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 283
	i32 486930444, ; 78: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 296
	i32 490002678, ; 79: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x1d34d8f6 => 197
	i32 495020624, ; 80: Microsoft.JSInterop.WebAssembly => 0x1d816a50 => 231
	i32 498788369, ; 81: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 82: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 346
	i32 503918385, ; 83: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 340
	i32 513247710, ; 84: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 228
	i32 526420162, ; 85: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 86: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 329
	i32 530272170, ; 87: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 88: Microsoft.Extensions.Logging => 0x20216150 => 223
	i32 540030774, ; 89: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 90: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 91: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 92: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 93: Jsr305Binding => 0x213954e7 => 322
	i32 569601784, ; 94: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 319
	i32 571435654, ; 95: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 218
	i32 577335427, ; 96: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 97: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 354
	i32 601371474, ; 98: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 99: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 100: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 101: Xamarin.AndroidX.CustomView => 0x2568904f => 273
	i32 627931235, ; 102: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 352
	i32 639843206, ; 103: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 279
	i32 643868501, ; 104: System.Net => 0x2660a755 => 81
	i32 662205335, ; 105: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 106: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 315
	i32 666292255, ; 107: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 260
	i32 672442732, ; 108: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 109: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 110: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 334
	i32 690569205, ; 111: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 112: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 331
	i32 693804605, ; 113: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 114: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 115: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 326
	i32 700358131, ; 116: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 117: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 349
	i32 709152836, ; 118: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 246
	i32 709557578, ; 119: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 337
	i32 720511267, ; 120: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 330
	i32 722857257, ; 121: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 122: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 123: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 240
	i32 752232764, ; 124: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 125: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 250
	i32 759454413, ; 126: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 127: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 128: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 129: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 358
	i32 789151979, ; 130: Microsoft.Extensions.Options => 0x2f0980eb => 227
	i32 790371945, ; 131: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 274
	i32 804008546, ; 132: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 191
	i32 804715423, ; 133: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 134: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 288
	i32 823281589, ; 135: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 136: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 137: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 138: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 139: Xamarin.AndroidX.Print => 0x3246f6cd => 301
	i32 873119928, ; 140: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 141: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 142: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 143: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 144: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 145: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 361
	i32 928116545, ; 146: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 325
	i32 952186615, ; 147: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 148: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 330
	i32 966729478, ; 149: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 323
	i32 967690846, ; 150: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 285
	i32 975236339, ; 151: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 152: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 153: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 154: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 155: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 156: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 157: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 220
	i32 1001831731, ; 158: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 159: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 305
	i32 1019214401, ; 160: System.Drawing => 0x3cbffa41 => 36
	i32 1020234808, ; 161: Microsoft.AspNetCore.Authentication.Cookies.dll => 0x3ccf8c38 => 182
	i32 1028951442, ; 162: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 215
	i32 1029334545, ; 163: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 336
	i32 1031528504, ; 164: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 324
	i32 1035644815, ; 165: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 258
	i32 1036536393, ; 166: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 167: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 168: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 292
	i32 1067306892, ; 169: GoogleGson => 0x3f9dcf8c => 177
	i32 1082857460, ; 170: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1083751839, ; 171: System.IO.Packaging => 0x4098bd9f => 244
	i32 1084122840, ; 172: Xamarin.Kotlin.StdLib => 0x409e66d8 => 327
	i32 1095180906, ; 173: Microsoft.AspNet.Identity.Core => 0x4147226a => 178
	i32 1098259244, ; 174: System => 0x41761b2c => 164
	i32 1106973742, ; 175: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 212
	i32 1110309514, ; 176: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 221
	i32 1112354281, ; 177: Microsoft.AspNetCore.Authentication.Abstractions => 0x424d2de9 => 181
	i32 1118262833, ; 178: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 349
	i32 1121599056, ; 179: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 291
	i32 1127624469, ; 180: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 225
	i32 1135815421, ; 181: Microsoft.AspNetCore.Cryptography.KeyDerivation.dll => 0x43b32afd => 193
	i32 1149092582, ; 182: Xamarin.AndroidX.Window => 0x447dc2e6 => 318
	i32 1157931901, ; 183: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 206
	i32 1168523401, ; 184: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 355
	i32 1170634674, ; 185: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 186: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 216
	i32 1175144683, ; 187: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 314
	i32 1178241025, ; 188: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 299
	i32 1202000627, ; 189: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 206
	i32 1203215381, ; 190: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 353
	i32 1204270330, ; 191: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 260
	i32 1204575371, ; 192: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 208
	i32 1208641965, ; 193: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 194: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1220193633, ; 195: Microsoft.Net.Http.Headers => 0x48baad61 => 238
	i32 1234928153, ; 196: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 351
	i32 1236289705, ; 197: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x49b048a9 => 197
	i32 1243150071, ; 198: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 319
	i32 1253011324, ; 199: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 200: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 335
	i32 1264511973, ; 201: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 309
	i32 1267360935, ; 202: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 313
	i32 1273260888, ; 203: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 265
	i32 1275534314, ; 204: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 331
	i32 1278448581, ; 205: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 257
	i32 1291457549, ; 206: EntityFramework.SqlServer.dll => 0x4cfa140d => 175
	i32 1292207520, ; 207: SQLitePCLRaw.core.dll => 0x4d0585a0 => 241
	i32 1292843635, ; 208: DocumentFormat.OpenXml.Framework => 0x4d0f3a73 => 174
	i32 1293217323, ; 209: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 276
	i32 1309188875, ; 210: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 211: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 318
	i32 1324164729, ; 212: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 213: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1338781641, ; 214: DocumentFormat.OpenXml.dll => 0x4fcc2fc9 => 173
	i32 1364015309, ; 215: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 216: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 365
	i32 1376866003, ; 217: Xamarin.AndroidX.SavedState => 0x52114ed3 => 305
	i32 1379779777, ; 218: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 219: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 220: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 269
	i32 1408764838, ; 221: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 222: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 223: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 224: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 333
	i32 1434145427, ; 225: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 226: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 323
	i32 1439761251, ; 227: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 228: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 229: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 230: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 217
	i32 1457743152, ; 231: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 232: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 233: es\Microsoft.Maui.Controls.resources => 0x57152abe => 339
	i32 1461234159, ; 234: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 235: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 236: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 237: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 259
	i32 1470490898, ; 238: Microsoft.Extensions.Primitives => 0x57a5e912 => 228
	i32 1479771757, ; 239: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 240: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 241: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 242: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 306
	i32 1493001747, ; 243: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 343
	i32 1494371055, ; 244: Microsoft.AspNet.Identity.Core.dll => 0x59124aef => 178
	i32 1514721132, ; 245: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 338
	i32 1521091094, ; 246: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 220
	i32 1536373174, ; 247: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 248: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 249: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 250: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 191
	i32 1550322496, ; 251: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 252: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 358
	i32 1560932650, ; 253: Microsoft.AspNetCore.Components.WebAssembly => 0x5d09f12a => 189
	i32 1565862583, ; 254: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 255: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 256: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 257: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 258: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 275
	i32 1588461737, ; 259: RCLAPI => 0x5eae00a9 => 367
	i32 1592978981, ; 260: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 261: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 324
	i32 1601112923, ; 262: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 263: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 264: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 265: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 295
	i32 1622358360, ; 266: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 267: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 317
	i32 1628395155, ; 268: Microsoft.AspNet.Identity.EntityFramework.dll => 0x610f5693 => 179
	i32 1632842087, ; 269: Microsoft.Extensions.Configuration.Json => 0x61533167 => 213
	i32 1635184631, ; 270: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 279
	i32 1636350590, ; 271: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 272
	i32 1639515021, ; 272: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 273: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 274: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 275: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 190
	i32 1657153582, ; 276: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 277: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 311
	i32 1658251792, ; 278: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 321
	i32 1670060433, ; 279: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 267
	i32 1675553242, ; 280: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 281: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 282: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 283: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1689493916, ; 284: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 205
	i32 1691477237, ; 285: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 286: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 287: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 328
	i32 1701541528, ; 288: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 289: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 242
	i32 1720223769, ; 290: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 288
	i32 1726116996, ; 291: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 292: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 293: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 263
	i32 1736233607, ; 294: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 356
	i32 1743415430, ; 295: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 334
	i32 1744735666, ; 296: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 297: System.IO.Pipelines.dll => 0x68139a0d => 245
	i32 1746316138, ; 298: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 299: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 300: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 301: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 188
	i32 1763938596, ; 302: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 303: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 304: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 310
	i32 1770582343, ; 305: Microsoft.Extensions.Logging.dll => 0x6988f147 => 223
	i32 1776026572, ; 306: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 307: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 308: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 309: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 350
	i32 1788241197, ; 310: Xamarin.AndroidX.Fragment => 0x6a96652d => 281
	i32 1791755720, ; 311: Microsoft.AspNetCore.Authentication.dll => 0x6acc05c8 => 180
	i32 1793755602, ; 312: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 342
	i32 1808609942, ; 313: Xamarin.AndroidX.Loader => 0x6bcd3296 => 295
	i32 1813058853, ; 314: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 327
	i32 1813201214, ; 315: Xamarin.Google.Android.Material => 0x6c13413e => 321
	i32 1818569960, ; 316: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 300
	i32 1818787751, ; 317: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819327070, ; 318: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 201
	i32 1820883333, ; 319: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x6c887985 => 192
	i32 1824175904, ; 320: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 321: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 322: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 224
	i32 1842015223, ; 323: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 362
	i32 1847515442, ; 324: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 250
	i32 1853025655, ; 325: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 359
	i32 1858542181, ; 326: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1862132565, ; 327: Microsoft.JSInterop.WebAssembly.dll => 0x6efde355 => 231
	i32 1867746548, ; 328: Xamarin.Essentials.dll => 0x6f538cf4 => 320
	i32 1870277092, ; 329: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 330: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 341
	i32 1879696579, ; 331: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 332: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 261
	i32 1888955245, ; 333: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 334: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 335: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 336: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 337: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1928288591, ; 338: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 199
	i32 1939592360, ; 339: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953680223, ; 340: Microsoft.AspNetCore.DataProtection.Abstractions => 0x7472cb5f => 195
	i32 1956758971, ; 341: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 342: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 307
	i32 1968388702, ; 343: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 209
	i32 1983156543, ; 344: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 328
	i32 1985761444, ; 345: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 252
	i32 1991044029, ; 346: Microsoft.Extensions.Identity.Core.dll => 0x76acebbd => 222
	i32 2003115576, ; 347: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 338
	i32 2011961780, ; 348: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019368771, ; 349: RCLAPI.dll => 0x785d1f43 => 367
	i32 2019465201, ; 350: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 292
	i32 2025202353, ; 351: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 333
	i32 2031763787, ; 352: Xamarin.Android.Glide => 0x791a414b => 249
	i32 2038923757, ; 353: ProdutosMAUI => 0x798781ed => 0
	i32 2045470958, ; 354: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 355: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 211
	i32 2055257422, ; 356: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 287
	i32 2060060697, ; 357: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 358: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 337
	i32 2070888862, ; 359: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 360: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 219
	i32 2075706075, ; 361: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 199
	i32 2076659885, ; 362: Microsoft.Extensions.WebEncoders => 0x7bc750ad => 229
	i32 2079903147, ; 363: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2085039813, ; 364: System.Security.Cryptography.Xml.dll => 0x7c472ec5 => 247
	i32 2090596640, ; 365: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 366: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 243
	i32 2127167465, ; 367: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 368: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 369: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 370: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 371: Microsoft.Maui => 0x80bd55ad => 235
	i32 2169148018, ; 372: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 345
	i32 2181898931, ; 373: Microsoft.Extensions.Options.dll => 0x820d22b3 => 227
	i32 2192057212, ; 374: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 224
	i32 2192166651, ; 375: Microsoft.AspNetCore.Components.Authorization.dll => 0x82a9cefb => 186
	i32 2193016926, ; 376: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 377: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 332
	i32 2201231467, ; 378: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 379: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 226
	i32 2207618523, ; 380: it\Microsoft.Maui.Controls.resources => 0x839595db => 347
	i32 2217644978, ; 381: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 314
	i32 2222056684, ; 382: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2242871324, ; 383: Microsoft.AspNetCore.Http.dll => 0x85af801c => 198
	i32 2244775296, ; 384: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 296
	i32 2252106437, ; 385: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 386: Microsoft.EntityFrameworkCore => 0x86487ec9 => 205
	i32 2256313426, ; 387: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 388: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 389: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 210
	i32 2267999099, ; 390: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 251
	i32 2270573516, ; 391: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 341
	i32 2279755925, ; 392: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 303
	i32 2291847450, ; 393: Microsoft.AspNetCore.DataProtection.dll => 0x889ad11a => 194
	i32 2293034957, ; 394: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 395: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 396: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 397: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 351
	i32 2305521784, ; 398: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 399: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 255
	i32 2320631194, ; 400: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 401: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 402: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 403: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 404: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 405: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 209
	i32 2378619854, ; 406: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 407: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 408: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 346
	i32 2401565422, ; 409: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 410: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 278
	i32 2411328690, ; 411: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 185
	i32 2421380589, ; 412: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 413: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 265
	i32 2427813419, ; 414: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 343
	i32 2435356389, ; 415: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 416: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 417: Microsoft.JSInterop.dll => 0x919672ca => 230
	i32 2454642406, ; 418: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458592288, ; 419: Microsoft.AspNetCore.Authentication.Core => 0x928b2420 => 183
	i32 2458678730, ; 420: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 421: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 422: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 240
	i32 2465532216, ; 423: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 268
	i32 2471841756, ; 424: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 425: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 426: Microsoft.Maui.Controls => 0x93dba8a1 => 233
	i32 2483903535, ; 427: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 428: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 429: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 430: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 431: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 290
	i32 2522472828, ; 432: Xamarin.Android.Glide.dll => 0x9659e17c => 249
	i32 2537015816, ; 433: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 184
	i32 2538310050, ; 434: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 435: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 344
	i32 2554139094, ; 436: ProdutosMAUI.dll => 0x983d11d6 => 0
	i32 2562349572, ; 437: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 438: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 439: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 291
	i32 2581819634, ; 440: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 313
	i32 2585220780, ; 441: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 442: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 443: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 187
	i32 2589602615, ; 444: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 445: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 216
	i32 2593496499, ; 446: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 353
	i32 2594125473, ; 447: Microsoft.AspNetCore.Hosting.Abstractions => 0x9a9f36a1 => 196
	i32 2598563041, ; 448: RCLProdutos => 0x9ae2ece1 => 369
	i32 2605712449, ; 449: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 332
	i32 2615233544, ; 450: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 282
	i32 2616218305, ; 451: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 225
	i32 2617129537, ; 452: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 453: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 454: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 272
	i32 2624644809, ; 455: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 277
	i32 2626831493, ; 456: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 348
	i32 2627185994, ; 457: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2627811740, ; 458: Microsoft.AspNetCore.Components.WebAssembly.dll => 0x9ca1399c => 189
	i32 2629843544, ; 459: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 460: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 286
	i32 2633959305, ; 461: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 200
	i32 2663391936, ; 462: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 251
	i32 2663698177, ; 463: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 464: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 465: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 466: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 467: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 468: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 190
	i32 2693849962, ; 469: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 470: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 311
	i32 2715334215, ; 471: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 472: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 473: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 474: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 475: Xamarin.AndroidX.Activity => 0xa2e0939b => 253
	i32 2735172069, ; 476: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 477: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 184
	i32 2737747696, ; 478: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 259
	i32 2740948882, ; 479: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 480: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 481: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 354
	i32 2758225723, ; 482: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 234
	i32 2764765095, ; 483: Microsoft.Maui.dll => 0xa4caf7a7 => 235
	i32 2765824710, ; 484: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 485: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 326
	i32 2778768386, ; 486: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 316
	i32 2779977773, ; 487: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 304
	i32 2782920994, ; 488: Microsoft.AspNetCore.Authentication.Cookies => 0xa5e00122 => 182
	i32 2785988530, ; 489: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 360
	i32 2788224221, ; 490: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 282
	i32 2801831435, ; 491: Microsoft.Maui.Graphics => 0xa7008e0b => 237
	i32 2803228030, ; 492: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 493: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 339
	i32 2810250172, ; 494: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 269
	i32 2819470561, ; 495: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 496: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 497: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 304
	i32 2824502124, ; 498: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 499: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 352
	i32 2833784645, ; 500: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 203
	i32 2838993487, ; 501: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 293
	i32 2841355853, ; 502: System.Security.Permissions => 0xa95ba64d => 248
	i32 2849599387, ; 503: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2850549256, ; 504: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 201
	i32 2853208004, ; 505: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 316
	i32 2855708567, ; 506: Xamarin.AndroidX.Transition => 0xaa36a797 => 312
	i32 2861098320, ; 507: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 508: Microsoft.Maui.Essentials => 0xaa8a4878 => 236
	i32 2870099610, ; 509: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 254
	i32 2875164099, ; 510: Jsr305Binding.dll => 0xab5f85c3 => 322
	i32 2875220617, ; 511: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 512: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 280
	i32 2887636118, ; 513: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 514: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 188
	i32 2899753641, ; 515: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 516: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 517: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 518: mscorlib.dll => 0xad2a79b6 => 166
	i32 2906598491, ; 519: Microsoft.AspNet.Identity.EntityFramework => 0xad3f2c5b => 179
	i32 2909740682, ; 520: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 521: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 219
	i32 2916751541, ; 522: EntityFramework => 0xadda18b5 => 176
	i32 2916838712, ; 523: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 317
	i32 2919462931, ; 524: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 525: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 256
	i32 2921417940, ; 526: System.Security.Cryptography.Xml => 0xae214cd4 => 247
	i32 2930358886, ; 527: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 0xaea9ba66 => 195
	i32 2936416060, ; 528: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 529: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 530: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 531: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 532: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 533: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978368250, ; 534: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0xb1864afa => 196
	i32 2978675010, ; 535: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 276
	i32 2987532451, ; 536: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 307
	i32 2996646946, ; 537: Microsoft.AspNetCore.Http => 0xb29d3422 => 198
	i32 2996846495, ; 538: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 289
	i32 3014607031, ; 539: Microsoft.AspNetCore.Cryptography.KeyDerivation => 0xb3af40b7 => 193
	i32 3016983068, ; 540: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 309
	i32 3023353419, ; 541: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 542: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 284
	i32 3033331042, ; 543: Microsoft.AspNetCore.Authentication.Core.dll => 0xb4ccf562 => 183
	i32 3036999524, ; 544: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 200
	i32 3038032645, ; 545: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 370
	i32 3056245963, ; 546: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 306
	i32 3057625584, ; 547: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 297
	i32 3059408633, ; 548: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 549: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 550: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 207
	i32 3075834255, ; 551: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 552: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 345
	i32 3090735792, ; 553: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3093090641, ; 554: Microsoft.Extensions.WebEncoders.dll => 0xb85cd151 => 229
	i32 3099732863, ; 555: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 556: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 557: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 558: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 559: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 560: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 561: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 562: GoogleGson.dll => 0xbba64c02 => 177
	i32 3155681111, ; 563: Microsoft.AspNetCore.DataProtection => 0xbc17df57 => 194
	i32 3159123045, ; 564: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 565: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 566: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 298
	i32 3192346100, ; 567: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 568: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 569: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 207
	i32 3204380047, ; 570: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 571: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 572: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 275
	i32 3213246214, ; 573: System.Security.Permissions.dll => 0xbf863f06 => 248
	i32 3220365878, ; 574: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 575: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 576: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3257523865, ; 577: Microsoft.AspNetCore.Identity.dll => 0xc229de99 => 202
	i32 3258312781, ; 578: Xamarin.AndroidX.CardView => 0xc235e84d => 263
	i32 3265493905, ; 579: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 580: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 581: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 582: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 583: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286872994, ; 584: SQLite-net.dll => 0xc3e9b3a2 => 239
	i32 3290767353, ; 585: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 586: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 587: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 204
	i32 3303498502, ; 588: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 589: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 340
	i32 3316684772, ; 590: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 591: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 273
	i32 3317144872, ; 592: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 593: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 261
	i32 3345895724, ; 594: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 302
	i32 3346324047, ; 595: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 299
	i32 3357674450, ; 596: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 357
	i32 3358260929, ; 597: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 598: SQLitePCLRaw.core => 0xc849ca45 => 241
	i32 3362336904, ; 599: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 254
	i32 3362522851, ; 600: Xamarin.AndroidX.Core => 0xc86c06e3 => 270
	i32 3366347497, ; 601: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 602: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 303
	i32 3381016424, ; 603: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 336
	i32 3395150330, ; 604: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 605: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 606: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 274
	i32 3406629867, ; 607: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 217
	i32 3421170118, ; 608: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 211
	i32 3428513518, ; 609: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 214
	i32 3429136800, ; 610: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 611: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 612: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 277
	i32 3445260447, ; 613: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 614: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 232
	i32 3463511458, ; 615: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 344
	i32 3464190856, ; 616: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 187
	i32 3471940407, ; 617: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 618: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 619: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 357
	i32 3484440000, ; 620: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 356
	i32 3485117614, ; 621: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 622: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 623: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 266
	i32 3500000672, ; 624: Microsoft.JSInterop => 0xd09dc5a0 => 230
	i32 3509114376, ; 625: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 626: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 627: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 628: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 629: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 630: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 631: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 364
	i32 3597029428, ; 632: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 252
	i32 3598340787, ; 633: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 634: System.Linq.dll => 0xd715a361 => 61
	i32 3619374377, ; 635: Microsoft.Extensions.Identity.Core => 0xd7bb4529 => 222
	i32 3624195450, ; 636: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 637: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 301
	i32 3633644679, ; 638: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 256
	i32 3638274909, ; 639: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 640: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 287
	i32 3643446276, ; 641: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 361
	i32 3643854240, ; 642: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 298
	i32 3645089577, ; 643: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3653734595, ; 644: EntityFramework.dll => 0xd9c790c3 => 176
	i32 3657292374, ; 645: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 210
	i32 3660523487, ; 646: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 647: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 648: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 262
	i32 3684561358, ; 649: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 266
	i32 3697841164, ; 650: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 366
	i32 3700866549, ; 651: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 652: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 271
	i32 3716563718, ; 653: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 654: Xamarin.AndroidX.Annotation => 0xdda814c6 => 255
	i32 3722202641, ; 655: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 213
	i32 3724971120, ; 656: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 297
	i32 3732100267, ; 657: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 658: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 203
	i32 3737834244, ; 659: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 660: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 661: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 662: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 243
	i32 3757377913, ; 663: EntityFramework.SqlServer => 0xdff50979 => 175
	i32 3758424670, ; 664: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 212
	i32 3765508441, ; 665: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 226
	i32 3786282454, ; 666: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 264
	i32 3792276235, ; 667: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 668: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 232
	i32 3802395368, ; 669: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3807198597, ; 670: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 246
	i32 3819260425, ; 671: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3822443793, ; 672: DocumentFormat.OpenXml => 0xe3d5dd11 => 173
	i32 3823082795, ; 673: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 674: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 675: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 215
	i32 3844307129, ; 676: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 677: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 678: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 679: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 680: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876362041, ; 681: SQLite-net => 0xe70c9739 => 239
	i32 3885497537, ; 682: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 683: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 312
	i32 3888767677, ; 684: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 302
	i32 3889960447, ; 685: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 365
	i32 3896106733, ; 686: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 687: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 270
	i32 3901907137, ; 688: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3913109504, ; 689: RCLProdutos.dll => 0xe93d5000 => 369
	i32 3920810846, ; 690: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 691: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 315
	i32 3928044579, ; 692: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 693: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 694: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 300
	i32 3945713374, ; 695: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3952357212, ; 696: System.IO.Packaging.dll => 0xeb942f5c => 244
	i32 3953953790, ; 697: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 698: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 258
	i32 3959773229, ; 699: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 289
	i32 3980434154, ; 700: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 360
	i32 3987592930, ; 701: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 342
	i32 4003436829, ; 702: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 703: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 257
	i32 4023392905, ; 704: System.IO.Pipelines => 0xefd01a89 => 245
	i32 4025784931, ; 705: System.Memory => 0xeff49a63 => 62
	i32 4044155772, ; 706: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 238
	i32 4046471985, ; 707: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 234
	i32 4054681211, ; 708: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 709: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 710: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4078967171, ; 711: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 221
	i32 4094352644, ; 712: Microsoft.Maui.Essentials.dll => 0xf40add04 => 236
	i32 4099507663, ; 713: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 714: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 715: Xamarin.AndroidX.Emoji2 => 0xf479582c => 278
	i32 4101842092, ; 716: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 208
	i32 4102112229, ; 717: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 355
	i32 4118552436, ; 718: Microsoft.AspNetCore.Authentication => 0xf57c1f74 => 180
	i32 4125707920, ; 719: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 350
	i32 4126470640, ; 720: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 214
	i32 4127667938, ; 721: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 722: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 723: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 724: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 362
	i32 4151237749, ; 725: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 726: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 727: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 728: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 729: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 730: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 294
	i32 4185676441, ; 731: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 732: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 733: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 734: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 271
	i32 4258378803, ; 735: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 293
	i32 4260525087, ; 736: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 737: Microsoft.Maui.Controls.dll => 0xfea12dee => 233
	i32 4274976490, ; 738: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 739: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 294
	i32 4294648842, ; 740: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 218
	i32 4294763496 ; 741: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 280
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [742 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 290, ; 3
	i32 325, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 368, ; 8
	i32 30, ; 9
	i32 366, ; 10
	i32 124, ; 11
	i32 237, ; 12
	i32 102, ; 13
	i32 192, ; 14
	i32 308, ; 15
	i32 107, ; 16
	i32 308, ; 17
	i32 139, ; 18
	i32 329, ; 19
	i32 77, ; 20
	i32 368, ; 21
	i32 124, ; 22
	i32 13, ; 23
	i32 264, ; 24
	i32 132, ; 25
	i32 204, ; 26
	i32 310, ; 27
	i32 151, ; 28
	i32 363, ; 29
	i32 364, ; 30
	i32 18, ; 31
	i32 262, ; 32
	i32 26, ; 33
	i32 202, ; 34
	i32 284, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 186, ; 39
	i32 91, ; 40
	i32 185, ; 41
	i32 267, ; 42
	i32 174, ; 43
	i32 147, ; 44
	i32 286, ; 45
	i32 283, ; 46
	i32 335, ; 47
	i32 54, ; 48
	i32 69, ; 49
	i32 181, ; 50
	i32 363, ; 51
	i32 253, ; 52
	i32 83, ; 53
	i32 348, ; 54
	i32 285, ; 55
	i32 242, ; 56
	i32 347, ; 57
	i32 131, ; 58
	i32 55, ; 59
	i32 149, ; 60
	i32 74, ; 61
	i32 145, ; 62
	i32 62, ; 63
	i32 146, ; 64
	i32 370, ; 65
	i32 165, ; 66
	i32 359, ; 67
	i32 268, ; 68
	i32 320, ; 69
	i32 12, ; 70
	i32 281, ; 71
	i32 125, ; 72
	i32 152, ; 73
	i32 113, ; 74
	i32 166, ; 75
	i32 164, ; 76
	i32 283, ; 77
	i32 296, ; 78
	i32 197, ; 79
	i32 231, ; 80
	i32 84, ; 81
	i32 346, ; 82
	i32 340, ; 83
	i32 228, ; 84
	i32 150, ; 85
	i32 329, ; 86
	i32 60, ; 87
	i32 223, ; 88
	i32 51, ; 89
	i32 103, ; 90
	i32 114, ; 91
	i32 40, ; 92
	i32 322, ; 93
	i32 319, ; 94
	i32 218, ; 95
	i32 120, ; 96
	i32 354, ; 97
	i32 52, ; 98
	i32 44, ; 99
	i32 119, ; 100
	i32 273, ; 101
	i32 352, ; 102
	i32 279, ; 103
	i32 81, ; 104
	i32 136, ; 105
	i32 315, ; 106
	i32 260, ; 107
	i32 8, ; 108
	i32 73, ; 109
	i32 334, ; 110
	i32 155, ; 111
	i32 331, ; 112
	i32 154, ; 113
	i32 92, ; 114
	i32 326, ; 115
	i32 45, ; 116
	i32 349, ; 117
	i32 246, ; 118
	i32 337, ; 119
	i32 330, ; 120
	i32 109, ; 121
	i32 129, ; 122
	i32 240, ; 123
	i32 25, ; 124
	i32 250, ; 125
	i32 72, ; 126
	i32 55, ; 127
	i32 46, ; 128
	i32 358, ; 129
	i32 227, ; 130
	i32 274, ; 131
	i32 191, ; 132
	i32 22, ; 133
	i32 288, ; 134
	i32 86, ; 135
	i32 43, ; 136
	i32 160, ; 137
	i32 71, ; 138
	i32 301, ; 139
	i32 3, ; 140
	i32 42, ; 141
	i32 63, ; 142
	i32 16, ; 143
	i32 53, ; 144
	i32 361, ; 145
	i32 325, ; 146
	i32 105, ; 147
	i32 330, ; 148
	i32 323, ; 149
	i32 285, ; 150
	i32 34, ; 151
	i32 158, ; 152
	i32 85, ; 153
	i32 32, ; 154
	i32 12, ; 155
	i32 51, ; 156
	i32 220, ; 157
	i32 56, ; 158
	i32 305, ; 159
	i32 36, ; 160
	i32 182, ; 161
	i32 215, ; 162
	i32 336, ; 163
	i32 324, ; 164
	i32 258, ; 165
	i32 35, ; 166
	i32 58, ; 167
	i32 292, ; 168
	i32 177, ; 169
	i32 17, ; 170
	i32 244, ; 171
	i32 327, ; 172
	i32 178, ; 173
	i32 164, ; 174
	i32 212, ; 175
	i32 221, ; 176
	i32 181, ; 177
	i32 349, ; 178
	i32 291, ; 179
	i32 225, ; 180
	i32 193, ; 181
	i32 318, ; 182
	i32 206, ; 183
	i32 355, ; 184
	i32 153, ; 185
	i32 216, ; 186
	i32 314, ; 187
	i32 299, ; 188
	i32 206, ; 189
	i32 353, ; 190
	i32 260, ; 191
	i32 208, ; 192
	i32 29, ; 193
	i32 52, ; 194
	i32 238, ; 195
	i32 351, ; 196
	i32 197, ; 197
	i32 319, ; 198
	i32 5, ; 199
	i32 335, ; 200
	i32 309, ; 201
	i32 313, ; 202
	i32 265, ; 203
	i32 331, ; 204
	i32 257, ; 205
	i32 175, ; 206
	i32 241, ; 207
	i32 174, ; 208
	i32 276, ; 209
	i32 85, ; 210
	i32 318, ; 211
	i32 61, ; 212
	i32 112, ; 213
	i32 173, ; 214
	i32 57, ; 215
	i32 365, ; 216
	i32 305, ; 217
	i32 99, ; 218
	i32 19, ; 219
	i32 269, ; 220
	i32 111, ; 221
	i32 101, ; 222
	i32 102, ; 223
	i32 333, ; 224
	i32 104, ; 225
	i32 323, ; 226
	i32 71, ; 227
	i32 38, ; 228
	i32 32, ; 229
	i32 217, ; 230
	i32 103, ; 231
	i32 73, ; 232
	i32 339, ; 233
	i32 9, ; 234
	i32 123, ; 235
	i32 46, ; 236
	i32 259, ; 237
	i32 228, ; 238
	i32 9, ; 239
	i32 43, ; 240
	i32 4, ; 241
	i32 306, ; 242
	i32 343, ; 243
	i32 178, ; 244
	i32 338, ; 245
	i32 220, ; 246
	i32 31, ; 247
	i32 138, ; 248
	i32 92, ; 249
	i32 191, ; 250
	i32 93, ; 251
	i32 358, ; 252
	i32 189, ; 253
	i32 49, ; 254
	i32 141, ; 255
	i32 112, ; 256
	i32 140, ; 257
	i32 275, ; 258
	i32 367, ; 259
	i32 115, ; 260
	i32 324, ; 261
	i32 157, ; 262
	i32 76, ; 263
	i32 79, ; 264
	i32 295, ; 265
	i32 37, ; 266
	i32 317, ; 267
	i32 179, ; 268
	i32 213, ; 269
	i32 279, ; 270
	i32 272, ; 271
	i32 64, ; 272
	i32 138, ; 273
	i32 15, ; 274
	i32 190, ; 275
	i32 116, ; 276
	i32 311, ; 277
	i32 321, ; 278
	i32 267, ; 279
	i32 48, ; 280
	i32 70, ; 281
	i32 80, ; 282
	i32 126, ; 283
	i32 205, ; 284
	i32 94, ; 285
	i32 121, ; 286
	i32 328, ; 287
	i32 26, ; 288
	i32 242, ; 289
	i32 288, ; 290
	i32 97, ; 291
	i32 28, ; 292
	i32 263, ; 293
	i32 356, ; 294
	i32 334, ; 295
	i32 149, ; 296
	i32 245, ; 297
	i32 169, ; 298
	i32 4, ; 299
	i32 98, ; 300
	i32 188, ; 301
	i32 33, ; 302
	i32 93, ; 303
	i32 310, ; 304
	i32 223, ; 305
	i32 21, ; 306
	i32 41, ; 307
	i32 170, ; 308
	i32 350, ; 309
	i32 281, ; 310
	i32 180, ; 311
	i32 342, ; 312
	i32 295, ; 313
	i32 327, ; 314
	i32 321, ; 315
	i32 300, ; 316
	i32 2, ; 317
	i32 201, ; 318
	i32 192, ; 319
	i32 134, ; 320
	i32 111, ; 321
	i32 224, ; 322
	i32 362, ; 323
	i32 250, ; 324
	i32 359, ; 325
	i32 58, ; 326
	i32 231, ; 327
	i32 320, ; 328
	i32 95, ; 329
	i32 341, ; 330
	i32 39, ; 331
	i32 261, ; 332
	i32 25, ; 333
	i32 94, ; 334
	i32 89, ; 335
	i32 99, ; 336
	i32 10, ; 337
	i32 199, ; 338
	i32 87, ; 339
	i32 195, ; 340
	i32 100, ; 341
	i32 307, ; 342
	i32 209, ; 343
	i32 328, ; 344
	i32 252, ; 345
	i32 222, ; 346
	i32 338, ; 347
	i32 7, ; 348
	i32 367, ; 349
	i32 292, ; 350
	i32 333, ; 351
	i32 249, ; 352
	i32 0, ; 353
	i32 88, ; 354
	i32 211, ; 355
	i32 287, ; 356
	i32 154, ; 357
	i32 337, ; 358
	i32 33, ; 359
	i32 219, ; 360
	i32 199, ; 361
	i32 229, ; 362
	i32 116, ; 363
	i32 247, ; 364
	i32 82, ; 365
	i32 243, ; 366
	i32 20, ; 367
	i32 11, ; 368
	i32 162, ; 369
	i32 3, ; 370
	i32 235, ; 371
	i32 345, ; 372
	i32 227, ; 373
	i32 224, ; 374
	i32 186, ; 375
	i32 84, ; 376
	i32 332, ; 377
	i32 64, ; 378
	i32 226, ; 379
	i32 347, ; 380
	i32 314, ; 381
	i32 143, ; 382
	i32 198, ; 383
	i32 296, ; 384
	i32 157, ; 385
	i32 205, ; 386
	i32 41, ; 387
	i32 117, ; 388
	i32 210, ; 389
	i32 251, ; 390
	i32 341, ; 391
	i32 303, ; 392
	i32 194, ; 393
	i32 131, ; 394
	i32 75, ; 395
	i32 66, ; 396
	i32 351, ; 397
	i32 172, ; 398
	i32 255, ; 399
	i32 143, ; 400
	i32 106, ; 401
	i32 151, ; 402
	i32 70, ; 403
	i32 156, ; 404
	i32 209, ; 405
	i32 121, ; 406
	i32 127, ; 407
	i32 346, ; 408
	i32 152, ; 409
	i32 278, ; 410
	i32 185, ; 411
	i32 141, ; 412
	i32 265, ; 413
	i32 343, ; 414
	i32 20, ; 415
	i32 14, ; 416
	i32 230, ; 417
	i32 135, ; 418
	i32 183, ; 419
	i32 75, ; 420
	i32 59, ; 421
	i32 240, ; 422
	i32 268, ; 423
	i32 167, ; 424
	i32 168, ; 425
	i32 233, ; 426
	i32 15, ; 427
	i32 74, ; 428
	i32 6, ; 429
	i32 23, ; 430
	i32 290, ; 431
	i32 249, ; 432
	i32 184, ; 433
	i32 91, ; 434
	i32 344, ; 435
	i32 0, ; 436
	i32 1, ; 437
	i32 136, ; 438
	i32 291, ; 439
	i32 313, ; 440
	i32 134, ; 441
	i32 69, ; 442
	i32 187, ; 443
	i32 146, ; 444
	i32 216, ; 445
	i32 353, ; 446
	i32 196, ; 447
	i32 369, ; 448
	i32 332, ; 449
	i32 282, ; 450
	i32 225, ; 451
	i32 88, ; 452
	i32 96, ; 453
	i32 272, ; 454
	i32 277, ; 455
	i32 348, ; 456
	i32 31, ; 457
	i32 189, ; 458
	i32 45, ; 459
	i32 286, ; 460
	i32 200, ; 461
	i32 251, ; 462
	i32 109, ; 463
	i32 158, ; 464
	i32 35, ; 465
	i32 22, ; 466
	i32 114, ; 467
	i32 190, ; 468
	i32 57, ; 469
	i32 311, ; 470
	i32 144, ; 471
	i32 118, ; 472
	i32 120, ; 473
	i32 110, ; 474
	i32 253, ; 475
	i32 139, ; 476
	i32 184, ; 477
	i32 259, ; 478
	i32 54, ; 479
	i32 105, ; 480
	i32 354, ; 481
	i32 234, ; 482
	i32 235, ; 483
	i32 133, ; 484
	i32 326, ; 485
	i32 316, ; 486
	i32 304, ; 487
	i32 182, ; 488
	i32 360, ; 489
	i32 282, ; 490
	i32 237, ; 491
	i32 159, ; 492
	i32 339, ; 493
	i32 269, ; 494
	i32 163, ; 495
	i32 132, ; 496
	i32 304, ; 497
	i32 161, ; 498
	i32 352, ; 499
	i32 203, ; 500
	i32 293, ; 501
	i32 248, ; 502
	i32 140, ; 503
	i32 201, ; 504
	i32 316, ; 505
	i32 312, ; 506
	i32 169, ; 507
	i32 236, ; 508
	i32 254, ; 509
	i32 322, ; 510
	i32 40, ; 511
	i32 280, ; 512
	i32 81, ; 513
	i32 188, ; 514
	i32 56, ; 515
	i32 37, ; 516
	i32 97, ; 517
	i32 166, ; 518
	i32 179, ; 519
	i32 172, ; 520
	i32 219, ; 521
	i32 176, ; 522
	i32 317, ; 523
	i32 82, ; 524
	i32 256, ; 525
	i32 247, ; 526
	i32 195, ; 527
	i32 98, ; 528
	i32 30, ; 529
	i32 159, ; 530
	i32 18, ; 531
	i32 127, ; 532
	i32 119, ; 533
	i32 196, ; 534
	i32 276, ; 535
	i32 307, ; 536
	i32 198, ; 537
	i32 289, ; 538
	i32 193, ; 539
	i32 309, ; 540
	i32 165, ; 541
	i32 284, ; 542
	i32 183, ; 543
	i32 200, ; 544
	i32 370, ; 545
	i32 306, ; 546
	i32 297, ; 547
	i32 170, ; 548
	i32 16, ; 549
	i32 207, ; 550
	i32 144, ; 551
	i32 345, ; 552
	i32 125, ; 553
	i32 229, ; 554
	i32 118, ; 555
	i32 38, ; 556
	i32 115, ; 557
	i32 47, ; 558
	i32 142, ; 559
	i32 117, ; 560
	i32 34, ; 561
	i32 177, ; 562
	i32 194, ; 563
	i32 95, ; 564
	i32 53, ; 565
	i32 298, ; 566
	i32 129, ; 567
	i32 153, ; 568
	i32 207, ; 569
	i32 24, ; 570
	i32 161, ; 571
	i32 275, ; 572
	i32 248, ; 573
	i32 148, ; 574
	i32 104, ; 575
	i32 89, ; 576
	i32 202, ; 577
	i32 263, ; 578
	i32 60, ; 579
	i32 142, ; 580
	i32 100, ; 581
	i32 5, ; 582
	i32 13, ; 583
	i32 239, ; 584
	i32 122, ; 585
	i32 135, ; 586
	i32 204, ; 587
	i32 28, ; 588
	i32 340, ; 589
	i32 72, ; 590
	i32 273, ; 591
	i32 24, ; 592
	i32 261, ; 593
	i32 302, ; 594
	i32 299, ; 595
	i32 357, ; 596
	i32 137, ; 597
	i32 241, ; 598
	i32 254, ; 599
	i32 270, ; 600
	i32 168, ; 601
	i32 303, ; 602
	i32 336, ; 603
	i32 101, ; 604
	i32 123, ; 605
	i32 274, ; 606
	i32 217, ; 607
	i32 211, ; 608
	i32 214, ; 609
	i32 163, ; 610
	i32 167, ; 611
	i32 277, ; 612
	i32 39, ; 613
	i32 232, ; 614
	i32 344, ; 615
	i32 187, ; 616
	i32 17, ; 617
	i32 171, ; 618
	i32 357, ; 619
	i32 356, ; 620
	i32 137, ; 621
	i32 150, ; 622
	i32 266, ; 623
	i32 230, ; 624
	i32 155, ; 625
	i32 130, ; 626
	i32 19, ; 627
	i32 65, ; 628
	i32 147, ; 629
	i32 47, ; 630
	i32 364, ; 631
	i32 252, ; 632
	i32 79, ; 633
	i32 61, ; 634
	i32 222, ; 635
	i32 106, ; 636
	i32 301, ; 637
	i32 256, ; 638
	i32 49, ; 639
	i32 287, ; 640
	i32 361, ; 641
	i32 298, ; 642
	i32 14, ; 643
	i32 176, ; 644
	i32 210, ; 645
	i32 68, ; 646
	i32 171, ; 647
	i32 262, ; 648
	i32 266, ; 649
	i32 366, ; 650
	i32 78, ; 651
	i32 271, ; 652
	i32 108, ; 653
	i32 255, ; 654
	i32 213, ; 655
	i32 297, ; 656
	i32 67, ; 657
	i32 203, ; 658
	i32 63, ; 659
	i32 27, ; 660
	i32 160, ; 661
	i32 243, ; 662
	i32 175, ; 663
	i32 212, ; 664
	i32 226, ; 665
	i32 264, ; 666
	i32 10, ; 667
	i32 232, ; 668
	i32 11, ; 669
	i32 246, ; 670
	i32 78, ; 671
	i32 173, ; 672
	i32 126, ; 673
	i32 83, ; 674
	i32 215, ; 675
	i32 66, ; 676
	i32 107, ; 677
	i32 65, ; 678
	i32 128, ; 679
	i32 122, ; 680
	i32 239, ; 681
	i32 77, ; 682
	i32 312, ; 683
	i32 302, ; 684
	i32 365, ; 685
	i32 8, ; 686
	i32 270, ; 687
	i32 2, ; 688
	i32 369, ; 689
	i32 44, ; 690
	i32 315, ; 691
	i32 156, ; 692
	i32 128, ; 693
	i32 300, ; 694
	i32 23, ; 695
	i32 244, ; 696
	i32 133, ; 697
	i32 258, ; 698
	i32 289, ; 699
	i32 360, ; 700
	i32 342, ; 701
	i32 29, ; 702
	i32 257, ; 703
	i32 245, ; 704
	i32 62, ; 705
	i32 238, ; 706
	i32 234, ; 707
	i32 90, ; 708
	i32 87, ; 709
	i32 148, ; 710
	i32 221, ; 711
	i32 236, ; 712
	i32 36, ; 713
	i32 86, ; 714
	i32 278, ; 715
	i32 208, ; 716
	i32 355, ; 717
	i32 180, ; 718
	i32 350, ; 719
	i32 214, ; 720
	i32 50, ; 721
	i32 6, ; 722
	i32 90, ; 723
	i32 362, ; 724
	i32 21, ; 725
	i32 162, ; 726
	i32 96, ; 727
	i32 50, ; 728
	i32 113, ; 729
	i32 294, ; 730
	i32 130, ; 731
	i32 76, ; 732
	i32 27, ; 733
	i32 271, ; 734
	i32 293, ; 735
	i32 7, ; 736
	i32 233, ; 737
	i32 110, ; 738
	i32 294, ; 739
	i32 218, ; 740
	i32 280 ; 741
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

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
