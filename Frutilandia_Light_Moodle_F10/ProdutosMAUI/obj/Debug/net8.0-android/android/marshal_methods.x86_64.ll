; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [371 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [742 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 277
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 228
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 236
	i64 160518225272466977, ; 4: Microsoft.Extensions.Hosting.Abstractions => 0x23a4679b5576e21 => 221
	i64 196720943101637631, ; 5: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 6: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 264
	i64 229794953483747371, ; 7: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 8: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 305
	i64 295915112840604065, ; 9: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 308
	i64 316157742385208084, ; 10: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 271
	i64 350667413455104241, ; 11: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 422779754995088667, ; 12: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 13: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 307
	i64 535107122908063503, ; 14: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 226
	i64 545109961164950392, ; 15: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 340
	i64 560278790331054453, ; 16: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 600385053610559562, ; 17: RCLComum.dll => 0x854ff0678e9484a => 368
	i64 634308326490598313, ; 18: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 290
	i64 648449422406355874, ; 19: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 212
	i64 649145001856603771, ; 20: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 668723562677762733, ; 21: Microsoft.Extensions.Configuration.Binder.dll => 0x947c88986577aad => 211
	i64 683390398661839228, ; 22: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 218
	i64 750875890346172408, ; 23: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 24: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 265
	i64 799765834175365804, ; 25: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 26: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 343
	i64 870603111519317375, ; 27: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 242
	i64 872800313462103108, ; 28: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 276
	i64 895210737996778430, ; 29: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 291
	i64 940822596282819491, ; 30: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 31: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1001381392624924420, ; 32: Microsoft.AspNetCore.Authentication.Core.dll => 0xde59f1230183704 => 183
	i64 1010599046655515943, ; 33: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1120440138749646132, ; 34: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 321
	i64 1121665720830085036, ; 35: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 351
	i64 1152743041985833843, ; 36: RCLProdutos.dll => 0xfff5db06ede6b73 => 369
	i64 1268860745194512059, ; 37: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301485588176585670, ; 38: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 241
	i64 1301626418029409250, ; 39: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 40: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 260
	i64 1326794923564391531, ; 41: Microsoft.AspNetCore.Authentication => 0x1269b8f40cd8dc6b => 180
	i64 1369545283391376210, ; 42: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 298
	i64 1404195534211153682, ; 43: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 44: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 45: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 46: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 233
	i64 1492954217099365037, ; 47: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 48: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1515118852840071656, ; 49: Microsoft.AspNet.Identity.EntityFramework.dll => 0x1506c891b807a1e8 => 179
	i64 1518315023656898250, ; 50: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 243
	i64 1537168428375924959, ; 51: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 52: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 349
	i64 1576750169145655260, ; 53: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 319
	i64 1624659445732251991, ; 54: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 259
	i64 1628611045998245443, ; 55: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 294
	i64 1636321030536304333, ; 56: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 284
	i64 1639340239664632727, ; 57: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x16c01b432b36d397 => 192
	i64 1651782184287836205, ; 58: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 59: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1682513316613008342, ; 60: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1735388228521408345, ; 61: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 62: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 63: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1776954265264967804, ; 64: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 230
	i64 1795316252682057001, ; 65: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 258
	i64 1825687700144851180, ; 66: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 67: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 339
	i64 1836611346387731153, ; 68: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 305
	i64 1847446322536158010, ; 69: DocumentFormat.OpenXml.Framework.dll => 0x19a372a4645e933a => 174
	i64 1854145951182283680, ; 70: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 71: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 72: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 255
	i64 1881198190668717030, ; 73: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 361
	i64 1897575647115118287, ; 74: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 307
	i64 1920760634179481754, ; 75: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 234
	i64 1959996714666907089, ; 76: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 361
	i64 1972385128188460614, ; 77: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 78: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 292
	i64 1983698669889758782, ; 79: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 335
	i64 2019660174692588140, ; 80: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 353
	i64 2040001226662520565, ; 81: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 82: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 83: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 329
	i64 2080945842184875448, ; 84: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 85: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 86: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2165310824878145998, ; 87: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 252
	i64 2165725771938924357, ; 88: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 262
	i64 2192948757939169934, ; 89: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 206
	i64 2200176636225660136, ; 90: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 225
	i64 2207662933261301575, ; 91: DocumentFormat.OpenXml => 0x1ea331bdb8d63747 => 173
	i64 2262844636196693701, ; 92: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 276
	i64 2287834202362508563, ; 93: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 94: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2295368378960711535, ; 95: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 191
	i64 2302323944321350744, ; 96: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 357
	i64 2304837677853103545, ; 97: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 304
	i64 2315304989185124968, ; 98: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 99: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 287
	i64 2335503487726329082, ; 100: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 101: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2470498323731680442, ; 102: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 269
	i64 2479423007379663237, ; 103: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 314
	i64 2497223385847772520, ; 104: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 105: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 253
	i64 2592350477072141967, ; 106: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 107: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 360
	i64 2624866290265602282, ; 108: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 109: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 110: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 214
	i64 2662981627730767622, ; 111: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 335
	i64 2706075432581334785, ; 112: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2741613924229396860, ; 113: EntityFramework.SqlServer.dll => 0x260c2b56a0f5397c => 175
	i64 2781169761569919449, ; 114: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 230
	i64 2783046991838674048, ; 115: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 116: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 309
	i64 2815524396660695947, ; 117: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2895129759130297543, ; 118: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 340
	i64 2923871038697555247, ; 119: Jsr305Binding => 0x2893ad37e69ec52f => 322
	i64 3017136373564924869, ; 120: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 121: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 321
	i64 3080904423057169497, ; 122: RCLAPI => 0x2ac1923fdb409c59 => 367
	i64 3106852385031680087, ; 123: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 124: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 125: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3168817962471953758, ; 126: Microsoft.Extensions.Hosting.Abstractions.dll => 0x2bf9e725d304955e => 221
	i64 3266690593535380875, ; 127: Microsoft.AspNetCore.Authorization => 0x2d559dc982c94d8b => 184
	i64 3281594302220646930, ; 128: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 129: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 285
	i64 3303437397778967116, ; 130: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 256
	i64 3311221304742556517, ; 131: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 132: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 133: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 134: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 332
	i64 3396143930648122816, ; 135: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 216
	i64 3429672777697402584, ; 136: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 236
	i64 3437845325506641314, ; 137: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 138: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 311
	i64 3494946837667399002, ; 139: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 209
	i64 3508450208084372758, ; 140: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 141: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 310
	i64 3523004241079211829, ; 142: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 208
	i64 3531994851595924923, ; 143: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 144: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 145: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 355
	i64 3571415421602489686, ; 146: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 147: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 210
	i64 3647754201059316852, ; 148: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 149: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 209
	i64 3659371656528649588, ; 150: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 250
	i64 3716579019761409177, ; 151: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 152: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 303
	i64 3753897248517198740, ; 153: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 190
	i64 3772598417116884899, ; 154: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 277
	i64 3794322307918838949, ; 155: Microsoft.AspNetCore.Metadata.dll => 0x34a824092ed7bca5 => 203
	i64 3869221888984012293, ; 156: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 223
	i64 3869649043256705283, ; 157: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3889433610606858880, ; 158: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 219
	i64 3890352374528606784, ; 159: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 234
	i64 3919223565570527920, ; 160: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 161: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 162: System.Memory => 0x370b03412596249e => 62
	i64 4005135229510678782, ; 163: Microsoft.AspNetCore.DataProtection.Abstractions => 0x379519456862f8fe => 195
	i64 4006972109285359177, ; 164: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 165: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 166: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 167: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 232
	i64 4120493066591692148, ; 168: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 366
	i64 4148881117810174540, ; 169: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 170: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 171: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 172: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 173: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 174: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 271
	i64 4205801962323029395, ; 175: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4206372723267232883, ; 176: RCLAPI.dll => 0x3a6009b49b3c6473 => 367
	i64 4225924121207573736, ; 177: Microsoft.AspNetCore.Authentication.Abstractions => 0x3aa57f992c550ce8 => 181
	i64 4235503420553921860, ; 178: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4243591448627561453, ; 179: Microsoft.AspNetCore.Http.Extensions.dll => 0x3ae443f06354c3ed => 200
	i64 4250192876909962317, ; 180: Microsoft.AspNetCore.Hosting.Abstractions => 0x3afbb7e72f1d244d => 196
	i64 4282138915307457788, ; 181: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4337444564132831293, ; 182: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 240
	i64 4356591372459378815, ; 183: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 363
	i64 4373617458794931033, ; 184: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4376666294362535240, ; 185: RCLComum => 0x3cbd0ace5fe77548 => 368
	i64 4384840217421645357, ; 186: Microsoft.AspNetCore.Components.Forms => 0x3cda14f22443862d => 187
	i64 4397634830160618470, ; 187: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4477672992252076438, ; 188: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 189: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 190: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4612482779465751747, ; 191: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 206
	i64 4636684751163556186, ; 192: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 315
	i64 4672453897036726049, ; 193: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 194: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 333
	i64 4716677666592453464, ; 195: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 196: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 197: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 289
	i64 4794310189461587505, ; 198: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 253
	i64 4795410492532947900, ; 199: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 310
	i64 4809057822547766521, ; 200: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 201: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 202: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 203: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 254
	i64 5081566143765835342, ; 204: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 205: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 206: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5106322746114322454, ; 207: Microsoft.AspNetCore.Authentication.dll => 0x46dd4d7baea43016 => 180
	i64 5112836352847824253, ; 208: Microsoft.AspNetCore.WebUtilities.dll => 0x46f47192ee32c57d => 204
	i64 5119492727527269518, ; 209: Microsoft.AspNet.Identity.Core.dll => 0x470c1782ee75648e => 178
	i64 5177565741364132164, ; 210: Microsoft.AspNetCore.Http => 0x47da689c1f3db944 => 198
	i64 5182934613077526976, ; 211: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5197073077358930460, ; 212: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 188
	i64 5203618020066742981, ; 213: Xamarin.Essentials => 0x4836f704f0e652c5 => 320
	i64 5205316157927637098, ; 214: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 296
	i64 5244375036463807528, ; 215: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 216: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 217: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 218: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 288
	i64 5290786973231294105, ; 219: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5376510917114486089, ; 220: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 314
	i64 5408338804355907810, ; 221: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 312
	i64 5423376490970181369, ; 222: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 223: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 224: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 225: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 267
	i64 5457765010617926378, ; 226: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 227: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 359
	i64 5507995362134886206, ; 228: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 229: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 362
	i64 5527431512186326818, ; 230: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 231: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 232: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 233: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 257
	i64 5591791169662171124, ; 234: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5610815111739789596, ; 235: Microsoft.AspNetCore.Authentication.Core => 0x4ddd9e9de3a4d11c => 183
	i64 5650097808083101034, ; 236: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 237: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 317
	i64 5724799082821825042, ; 238: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 280
	i64 5757522595884336624, ; 239: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 266
	i64 5783556987928984683, ; 240: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 241: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 286
	i64 5918659295201451090, ; 242: Microsoft.AspNetCore.Components.WebAssembly => 0x52234d45450bdc52 => 189
	i64 5959344983920014087, ; 243: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 306
	i64 5979151488806146654, ; 244: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 245: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 246: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 356
	i64 6102788177522843259, ; 247: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 306
	i64 6165777499998190031, ; 248: ProdutosMAUI => 0x55913df7f37cf9cf => 0
	i64 6182525717148725503, ; 249: Microsoft.AspNetCore.Components.Authorization => 0x55ccbe62215df0ff => 186
	i64 6183170893902868313, ; 250: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 240
	i64 6200764641006662125, ; 251: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 356
	i64 6222399776351216807, ; 252: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 253: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6270168066149956752, ; 254: RCLProdutos => 0x57041ca2a8ddbc90 => 369
	i64 6278736998281604212, ; 255: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 256: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6319713645133255417, ; 257: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 290
	i64 6357457916754632952, ; 258: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 370
	i64 6401687960814735282, ; 259: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 287
	i64 6478287442656530074, ; 260: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 344
	i64 6504860066809920875, ; 261: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 262
	i64 6548213210057960872, ; 262: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 273
	i64 6557084851308642443, ; 263: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 318
	i64 6560151584539558821, ; 264: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 227
	i64 6589202984700901502, ; 265: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 324
	i64 6591971792923354531, ; 266: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 288
	i64 6617685658146568858, ; 267: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6713440830605852118, ; 268: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 269: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 270: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 352
	i64 6772837112740759457, ; 271: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 272: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 355
	i64 6786606130239981554, ; 273: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 274: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 275: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 276: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 277: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6911788284027924527, ; 278: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x5feb9ad2f830f02f => 197
	i64 6920570528939222495, ; 279: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 190
	i64 7011053663211085209, ; 280: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 282
	i64 7060448593242414269, ; 281: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 247
	i64 7060896174307865760, ; 282: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 283: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 284: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 285: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 283
	i64 7105430439328552570, ; 286: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 246
	i64 7112547816752919026, ; 287: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7192745174564810625, ; 288: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 252
	i64 7220009545223068405, ; 289: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 359
	i64 7270811800166795866, ; 290: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 291: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 292: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7331765743953618630, ; 293: Microsoft.AspNetCore.Http.dll => 0x65bfaa1948bba6c6 => 198
	i64 7338192458477945005, ; 294: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 295: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 251
	i64 7377312882064240630, ; 296: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7488575175965059935, ; 297: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 298: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7592577537120840276, ; 299: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 300: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7637365915383206639, ; 301: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 320
	i64 7654504624184590948, ; 302: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 303: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 304: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 350
	i64 7714652370974252055, ; 305: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 306: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 291
	i64 7735176074855944702, ; 307: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 308: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 327
	i64 7791074099216502080, ; 309: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 310: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 311: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 259
	i64 7972383140441761405, ; 312: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 207
	i64 8014722069583580780, ; 313: Microsoft.AspNetCore.Components.Forms.dll => 0x6f3a03422b034e6c => 187
	i64 8025517457475554965, ; 314: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 315: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 316: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 317: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 285
	i64 8085230611270010360, ; 318: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 319: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 320: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 321: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 322: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 323: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 324: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 331
	i64 8246048515196606205, ; 325: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 237
	i64 8264926008854159966, ; 326: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 327: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 328: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 329: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 330: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 268
	i64 8399132193771933415, ; 331: Microsoft.Extensions.WebEncoders => 0x748fb63acf52cee7 => 229
	i64 8400357532724379117, ; 332: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 300
	i64 8406879421826901811, ; 333: Microsoft.JSInterop.WebAssembly.dll => 0x74ab3c4ae788a733 => 231
	i64 8410671156615598628, ; 334: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 335: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 289
	i64 8442828414178614895, ; 336: Microsoft.AspNetCore.Cryptography.KeyDerivation => 0x752af3b5eeb0de6f => 193
	i64 8476857680833348370, ; 337: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 248
	i64 8518412311883997971, ; 338: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8563666267364444763, ; 339: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 340: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 279
	i64 8601935802264776013, ; 341: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 312
	i64 8611142787134128904, ; 342: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x7780ecbdb94c0308 => 197
	i64 8614108721271900878, ; 343: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 354
	i64 8623059219396073920, ; 344: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 345: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 346: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 347: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 299
	i64 8648495978913578441, ; 348: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 349: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 354
	i64 8684531736582871431, ; 350: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 351: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8853378295825400934, ; 352: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 328
	i64 8941376889969657626, ; 353: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 354: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 302
	i64 8954753533646919997, ; 355: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9045785047181495996, ; 356: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 364
	i64 9111603110219107042, ; 357: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 208
	i64 9138683372487561558, ; 358: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9250544137016314866, ; 359: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 205
	i64 9312692141327339315, ; 360: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 317
	i64 9324707631942237306, ; 361: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 258
	i64 9413000421947348542, ; 362: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0x82a1b202f4c6163e => 196
	i64 9468215723722196442, ; 363: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9508211702228543126, ; 364: Microsoft.AspNetCore.Cryptography.KeyDerivation.dll => 0x83f3f42aa08b6696 => 193
	i64 9554839972845591462, ; 365: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 366: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 323
	i64 9584643793929893533, ; 367: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9643464320970503839, ; 368: Microsoft.AspNet.Identity.EntityFramework => 0x85d477b4e799b69f => 179
	i64 9650158550865574924, ; 369: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 213
	i64 9659729154652888475, ; 370: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 371: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 372: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 373: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 269
	i64 9702891218465930390, ; 374: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 375: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 319
	i64 9808709177481450983, ; 376: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9814504515138190298, ; 377: Microsoft.AspNetCore.Authentication.Cookies => 0x88341fdb67477bda => 182
	i64 9825649861376906464, ; 378: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 266
	i64 9834056768316610435, ; 379: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 380: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9864374015518639636, ; 381: Microsoft.AspNetCore.Cryptography.Internal => 0x88e54be746950614 => 192
	i64 9907349773706910547, ; 382: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 279
	i64 9924019376719386149, ; 383: EntityFramework => 0x89b9330b1d73d625 => 176
	i64 9933555792566666578, ; 384: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 385: Microsoft.Maui => 0x8a2b8315b36616ac => 235
	i64 9974604633896246661, ; 386: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 387: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 339
	i64 10017511394021241210, ; 388: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 225
	i64 10038780035334861115, ; 389: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 390: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 391: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 392: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 393: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 233
	i64 10105485790837105934, ; 394: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 395: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 336
	i64 10205853378024263619, ; 396: Microsoft.Extensions.Configuration.Binder => 0x8da279930adb4fc3 => 211
	i64 10226222362177979215, ; 397: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 329
	i64 10229024438826829339, ; 398: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 273
	i64 10236703004850800690, ; 399: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10243523786148452761, ; 400: Microsoft.AspNetCore.Http.Abstractions => 0x8e284e9c69a49999 => 199
	i64 10245369515835430794, ; 401: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 402: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 326
	i64 10360651442923773544, ; 403: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 404: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 405: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 311
	i64 10406448008575299332, ; 406: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 332
	i64 10430153318873392755, ; 407: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 270
	i64 10485858537740568411, ; 408: Microsoft.AspNetCore.Identity => 0x918540c89b06075b => 202
	i64 10506226065143327199, ; 409: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 334
	i64 10546663366131771576, ; 410: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 411: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 412: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10650478070646097812, ; 413: System.IO.Packaging => 0x93ce196068f2c794 => 244
	i64 10670374202010151210, ; 414: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 415: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10722976995944589488, ; 416: EntityFramework.dll => 0x94cfaac3d9f668b0 => 176
	i64 10734191584620811116, ; 417: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 218
	i64 10785150219063592792, ; 418: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10822644899632537592, ; 419: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 420: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 421: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 260
	i64 10899834349646441345, ; 422: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 423: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 424: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 11002576679268595294, ; 425: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 224
	i64 11009005086950030778, ; 426: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 235
	i64 11019817191295005410, ; 427: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 257
	i64 11023048688141570732, ; 428: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 429: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11050168729868392624, ; 430: Microsoft.AspNetCore.Http.Features => 0x995a15e9dbef58b0 => 201
	i64 11051904132540108364, ; 431: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 217
	i64 11071824625609515081, ; 432: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 324
	i64 11103970607964515343, ; 433: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 345
	i64 11136029745144976707, ; 434: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 322
	i64 11162124722117608902, ; 435: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 316
	i64 11188319605227840848, ; 436: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11218356222449480316, ; 437: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 185
	i64 11220793807500858938, ; 438: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 348
	i64 11226290749488709958, ; 439: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 227
	i64 11235648312900863002, ; 440: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11293348803414341309, ; 441: Microsoft.AspNetCore.Identity.dll => 0x9cba08e6e81836bd => 202
	i64 11329751333533450475, ; 442: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 443: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 272
	i64 11347436699239206956, ; 444: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 445: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 301
	i64 11432101114902388181, ; 446: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 447: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 448: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 449: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 450: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 282
	i64 11513602507638267977, ; 451: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 245
	i64 11518296021396496455, ; 452: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 346
	i64 11529969570048099689, ; 453: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 316
	i64 11530571088791430846, ; 454: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 223
	i64 11580057168383206117, ; 455: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 255
	i64 11591352189662810718, ; 456: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 309
	i64 11597308262950669618, ; 457: Microsoft.Extensions.Identity.Core.dll => 0xa0f1ea6b83e08d32 => 222
	i64 11597940890313164233, ; 458: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 459: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 283
	i64 11692977985522001935, ; 460: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 461: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 342
	i64 11707554492040141440, ; 462: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11739066727115742305, ; 463: SQLite-net.dll => 0xa2e98afdf8575c61 => 239
	i64 11743665907891708234, ; 464: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11806260347154423189, ; 465: SQLite-net => 0xa3d8433bc5eb5d95 => 239
	i64 11991047634523762324, ; 466: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 467: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12048689113179125827, ; 468: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 219
	i64 12058074296353848905, ; 469: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 220
	i64 12063623837170009990, ; 470: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 471: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 472: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 473: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 474: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 313
	i64 12145679461940342714, ; 475: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 476: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 249
	i64 12201331334810686224, ; 477: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 478: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12279246230491828964, ; 479: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 243
	i64 12313367145828839434, ; 480: System.IO.Pipelines => 0xaae1de2e1c17f00a => 245
	i64 12332222936682028543, ; 481: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12375446203996702057, ; 482: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12441092376399691269, ; 483: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0xaca7a399c11fbe05 => 181
	i64 12451044538927396471, ; 484: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 281
	i64 12459959602091767212, ; 485: Microsoft.AspNetCore.Components.Authorization.dll => 0xaceaab3e0e65b5ac => 186
	i64 12466513435562512481, ; 486: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 295
	i64 12475113361194491050, ; 487: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 370
	i64 12487638416075308985, ; 488: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 275
	i64 12517810545449516888, ; 489: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 490: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 263
	i64 12550732019250633519, ; 491: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12681088699309157496, ; 492: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 347
	i64 12699999919562409296, ; 493: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 494: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 264
	i64 12708238894395270091, ; 495: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 496: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 497: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 498: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 318
	i64 12823819093633476069, ; 499: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 360
	i64 12828192437253469131, ; 500: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 330
	i64 12835242264250840079, ; 501: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 502: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 228
	i64 12843770487262409629, ; 503: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 504: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12982280885948128408, ; 505: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 274
	i64 13003699287675270979, ; 506: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 191
	i64 13068258254871114833, ; 507: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13086625805112021739, ; 508: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 0xb59d08d5762992eb => 195
	i64 13129914918964716986, ; 509: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 278
	i64 13162471042547327635, ; 510: System.Security.Permissions => 0xb6aa7dace9662293 => 248
	i64 13173818576982874404, ; 511: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 512: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 334
	i64 13222659110913276082, ; 513: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 348
	i64 13343850469010654401, ; 514: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 515: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 516: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 342
	i64 13401370062847626945, ; 517: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 313
	i64 13404347523447273790, ; 518: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 268
	i64 13404984788036896679, ; 519: Microsoft.AspNetCore.Http.Abstractions.dll => 0xba0812a45e7447a7 => 199
	i64 13431476299110033919, ; 520: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 521: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 325
	i64 13463706743370286408, ; 522: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 523: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 327
	i64 13467053111158216594, ; 524: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 362
	i64 13491513212026656886, ; 525: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 261
	i64 13540124433173649601, ; 526: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 363
	i64 13545416393490209236, ; 527: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 346
	i64 13550417756503177631, ; 528: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 216
	i64 13572454107664307259, ; 529: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 303
	i64 13578472628727169633, ; 530: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 531: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 532: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 274
	i64 13647894001087880694, ; 533: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 534: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 254
	i64 13702626353344114072, ; 535: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 536: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 537: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 538: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 539: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 341
	i64 13768883594457632599, ; 540: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 541: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 344
	i64 13828521679616088467, ; 542: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 328
	i64 13881769479078963060, ; 543: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 544: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13921917134693230900, ; 545: Microsoft.AspNetCore.WebUtilities => 0xc13495df5dd06934 => 204
	i64 13928444506500929300, ; 546: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13959074834287824816, ; 547: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 281
	i64 14075334701871371868, ; 548: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14082136096249122791, ; 549: Microsoft.AspNetCore.Metadata => 0xc36dcc2b4fa28fe7 => 203
	i64 14100563506285742564, ; 550: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 336
	i64 14124974489674258913, ; 551: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 263
	i64 14125464355221830302, ; 552: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14133832980772275001, ; 553: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 205
	i64 14148919944076435199, ; 554: DocumentFormat.OpenXml.dll => 0xc45b0fb9961d9eff => 173
	i64 14178052285788134900, ; 555: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 250
	i64 14212104595480609394, ; 556: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 557: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 558: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 559: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 560: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 561: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 301
	i64 14298246716367104064, ; 562: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 563: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 564: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 565: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 251
	i64 14346402571976470310, ; 566: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14461014870687870182, ; 567: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 568: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 357
	i64 14486659737292545672, ; 569: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 286
	i64 14495724990987328804, ; 570: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 304
	i64 14522721392235705434, ; 571: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 338
	i64 14551742072151931844, ; 572: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 573: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 574: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14622043554576106986, ; 575: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 576: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 296
	i64 14669215534098758659, ; 577: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 214
	i64 14690985099581930927, ; 578: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 579: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 349
	i64 14744092281598614090, ; 580: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 365
	i64 14792063746108907174, ; 581: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 325
	i64 14832630590065248058, ; 582: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14852515768018889994, ; 583: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 272
	i64 14889905118082851278, ; 584: GoogleGson.dll => 0xcea391d0969961ce => 177
	i64 14892012299694389861, ; 585: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 366
	i64 14895643372947136109, ; 586: ProdutosMAUI.dll => 0xceb7f4ba296a5e6d => 0
	i64 14904040806490515477, ; 587: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 333
	i64 14912225920358050525, ; 588: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 589: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 590: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 215
	i64 14984936317414011727, ; 591: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 592: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 593: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 275
	i64 15015154896917945444, ; 594: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 595: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15071021337266399595, ; 596: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 597: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 598: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 350
	i64 15115185479366240210, ; 599: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 600: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 601: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 302
	i64 15227001540531775957, ; 602: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 210
	i64 15234786388537674379, ; 603: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 604: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 605: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 265
	i64 15279429628684179188, ; 606: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 331
	i64 15299439993936780255, ; 607: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15338463749992804988, ; 608: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15355483035186022585, ; 609: Microsoft.AspNet.Identity.Core => 0xd519a276b2ccc8b9 => 178
	i64 15370334346939861994, ; 610: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 270
	i64 15391712275433856905, ; 611: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 215
	i64 15427448221306938193, ; 612: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 188
	i64 15481710163200268842, ; 613: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 217
	i64 15526743539506359484, ; 614: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 615: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 616: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 617: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 337
	i64 15541854775306130054, ; 618: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 619: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15565247197164990907, ; 620: Microsoft.AspNetCore.Http.Extensions => 0xd802dddb8c29f1bb => 200
	i64 15582737692548360875, ; 621: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 294
	i64 15592226634512578529, ; 622: Microsoft.AspNetCore.Authorization.dll => 0xd862b7834f81b7e1 => 184
	i64 15609085926864131306, ; 623: System.dll => 0xd89e9cf3334914ea => 164
	i64 15661133872274321916, ; 624: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 625: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 337
	i64 15710114879900314733, ; 626: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 627: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 345
	i64 15755368083429170162, ; 628: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 629: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 308
	i64 15783653065526199428, ; 630: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 338
	i64 15817206913877585035, ; 631: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15827202283623377193, ; 632: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 213
	i64 15847085070278954535, ; 633: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15852824340364052161, ; 634: Microsoft.AspNetCore.Http.Features.dll => 0xdc008bbee610c6c1 => 201
	i64 15885744048853936810, ; 635: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15917157041579513718, ; 636: Microsoft.AspNetCore.Authentication.Cookies.dll => 0xdce519ff21745776 => 182
	i64 15928521404965645318, ; 637: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 232
	i64 15934062614519587357, ; 638: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 639: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 640: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 641: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 642: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16027684189145026053, ; 643: Microsoft.AspNetCore.DataProtection => 0xde6dc5da0a224e05 => 194
	i64 16046481083542319511, ; 644: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 226
	i64 16054465462676478687, ; 645: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16153500642854367575, ; 646: Microsoft.Extensions.WebEncoders.dll => 0xe02cc33ff060f157 => 229
	i64 16154507427712707110, ; 647: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 648: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16288847719894691167, ; 649: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 351
	i64 16315482530584035869, ; 650: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 651: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 224
	i64 16337011941688632206, ; 652: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 653: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 280
	i64 16423015068819898779, ; 654: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 330
	i64 16454459195343277943, ; 655: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 656: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16523284800709429098, ; 657: Microsoft.AspNetCore.DataProtection.dll => 0xe54e7ffb6ce5876a => 194
	i64 16589693266713801121, ; 658: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 293
	i64 16621146507174665210, ; 659: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 267
	i64 16649148416072044166, ; 660: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 237
	i64 16677317093839702854, ; 661: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 300
	i64 16702652415771857902, ; 662: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 663: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 664: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16755018182064898362, ; 665: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 241
	i64 16758309481308491337, ; 666: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 667: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16763512187801783862, ; 668: Microsoft.JSInterop.WebAssembly => 0xe8a3f58495db4e36 => 231
	i64 16765015072123548030, ; 669: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16822611501064131242, ; 670: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 671: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 672: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 673: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 674: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 675: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 358
	i64 16977952268158210142, ; 676: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 677: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 293
	i64 16998075588627545693, ; 678: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 298
	i64 17008137082415910100, ; 679: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 680: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 256
	i64 17031351772568316411, ; 681: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 297
	i64 17037200463775726619, ; 682: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 284
	i64 17047433665992082296, ; 683: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 212
	i64 17062143951396181894, ; 684: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17079998892748052666, ; 685: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 185
	i64 17089008752050867324, ; 686: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 365
	i64 17118171214553292978, ; 687: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17126545051278881272, ; 688: Microsoft.Net.Http.Headers.dll => 0xedadb5fbdb33b1f8 => 238
	i64 17187273293601214786, ; 689: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 690: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 691: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17205988430934219272, ; 692: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 220
	i64 17230721278011714856, ; 693: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 694: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 695: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17333249706306540043, ; 696: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 697: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 698: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 343
	i64 17360349973592121190, ; 699: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 323
	i64 17438153253682247751, ; 700: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 358
	i64 17470386307322966175, ; 701: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 702: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 703: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 341
	i64 17522591619082469157, ; 704: GoogleGson => 0xf32cc03d27a5bf25 => 177
	i64 17590473451926037903, ; 705: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 249
	i64 17623389608345532001, ; 706: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 353
	i64 17627500474728259406, ; 707: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 708: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 709: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 364
	i64 17704177640604968747, ; 710: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 295
	i64 17710060891934109755, ; 711: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 292
	i64 17712670374920797664, ; 712: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17777860260071588075, ; 713: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17838668724098252521, ; 714: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 715: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 326
	i64 17910264068556501837, ; 716: Microsoft.Extensions.Identity.Core => 0xf88e0a4717c0b34d => 222
	i64 17911643751311784505, ; 717: Microsoft.Net.Http.Headers => 0xf892f1178448ba39 => 238
	i64 17928294245072900555, ; 718: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17981332794496557478, ; 719: EntityFramework.SqlServer => 0xf98a86e84c0ca1a6 => 175
	i64 17992315986609351877, ; 720: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18017743553296241350, ; 721: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 207
	i64 18025913125965088385, ; 722: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 723: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 352
	i64 18116111925905154859, ; 724: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 261
	i64 18121036031235206392, ; 725: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 297
	i64 18146411883821974900, ; 726: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 727: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 728: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 246
	i64 18225059387460068507, ; 729: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 730: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 731: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 278
	i64 18284618658670613420, ; 732: System.IO.Packaging.dll => 0xfdc003cb438a93ac => 244
	i64 18305135509493619199, ; 733: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 299
	i64 18318849532986632368, ; 734: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 735: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 347
	i64 18337789674395175250, ; 736: Microsoft.AspNetCore.Components.WebAssembly.dll => 0xfe7cea8d14268952 => 189
	i64 18341799084585866416, ; 737: DocumentFormat.OpenXml.Framework => 0xfe8b2916a25354b0 => 174
	i64 18370042311372477656, ; 738: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 242
	i64 18380184030268848184, ; 739: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 315
	i64 18428404840311395189, ; 740: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 247
	i64 18439108438687598470 ; 741: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [742 x i32] [
	i32 277, ; 0
	i32 228, ; 1
	i32 171, ; 2
	i32 236, ; 3
	i32 221, ; 4
	i32 58, ; 5
	i32 264, ; 6
	i32 151, ; 7
	i32 305, ; 8
	i32 308, ; 9
	i32 271, ; 10
	i32 132, ; 11
	i32 56, ; 12
	i32 307, ; 13
	i32 226, ; 14
	i32 340, ; 15
	i32 95, ; 16
	i32 368, ; 17
	i32 290, ; 18
	i32 212, ; 19
	i32 129, ; 20
	i32 211, ; 21
	i32 218, ; 22
	i32 145, ; 23
	i32 265, ; 24
	i32 18, ; 25
	i32 343, ; 26
	i32 242, ; 27
	i32 276, ; 28
	i32 291, ; 29
	i32 150, ; 30
	i32 104, ; 31
	i32 183, ; 32
	i32 95, ; 33
	i32 321, ; 34
	i32 351, ; 35
	i32 369, ; 36
	i32 36, ; 37
	i32 241, ; 38
	i32 28, ; 39
	i32 260, ; 40
	i32 180, ; 41
	i32 298, ; 42
	i32 50, ; 43
	i32 115, ; 44
	i32 70, ; 45
	i32 233, ; 46
	i32 65, ; 47
	i32 170, ; 48
	i32 179, ; 49
	i32 243, ; 50
	i32 145, ; 51
	i32 349, ; 52
	i32 319, ; 53
	i32 259, ; 54
	i32 294, ; 55
	i32 284, ; 56
	i32 192, ; 57
	i32 40, ; 58
	i32 89, ; 59
	i32 81, ; 60
	i32 66, ; 61
	i32 62, ; 62
	i32 86, ; 63
	i32 230, ; 64
	i32 258, ; 65
	i32 106, ; 66
	i32 339, ; 67
	i32 305, ; 68
	i32 174, ; 69
	i32 102, ; 70
	i32 35, ; 71
	i32 255, ; 72
	i32 361, ; 73
	i32 307, ; 74
	i32 234, ; 75
	i32 361, ; 76
	i32 119, ; 77
	i32 292, ; 78
	i32 335, ; 79
	i32 353, ; 80
	i32 142, ; 81
	i32 141, ; 82
	i32 329, ; 83
	i32 53, ; 84
	i32 35, ; 85
	i32 141, ; 86
	i32 252, ; 87
	i32 262, ; 88
	i32 206, ; 89
	i32 225, ; 90
	i32 173, ; 91
	i32 276, ; 92
	i32 8, ; 93
	i32 14, ; 94
	i32 191, ; 95
	i32 357, ; 96
	i32 304, ; 97
	i32 51, ; 98
	i32 287, ; 99
	i32 136, ; 100
	i32 101, ; 101
	i32 269, ; 102
	i32 314, ; 103
	i32 116, ; 104
	i32 253, ; 105
	i32 163, ; 106
	i32 360, ; 107
	i32 166, ; 108
	i32 67, ; 109
	i32 214, ; 110
	i32 335, ; 111
	i32 80, ; 112
	i32 175, ; 113
	i32 230, ; 114
	i32 101, ; 115
	i32 309, ; 116
	i32 117, ; 117
	i32 340, ; 118
	i32 322, ; 119
	i32 78, ; 120
	i32 321, ; 121
	i32 367, ; 122
	i32 114, ; 123
	i32 121, ; 124
	i32 48, ; 125
	i32 221, ; 126
	i32 184, ; 127
	i32 128, ; 128
	i32 285, ; 129
	i32 256, ; 130
	i32 82, ; 131
	i32 110, ; 132
	i32 75, ; 133
	i32 332, ; 134
	i32 216, ; 135
	i32 236, ; 136
	i32 53, ; 137
	i32 311, ; 138
	i32 209, ; 139
	i32 69, ; 140
	i32 310, ; 141
	i32 208, ; 142
	i32 83, ; 143
	i32 172, ; 144
	i32 355, ; 145
	i32 116, ; 146
	i32 210, ; 147
	i32 156, ; 148
	i32 209, ; 149
	i32 250, ; 150
	i32 167, ; 151
	i32 303, ; 152
	i32 190, ; 153
	i32 277, ; 154
	i32 203, ; 155
	i32 223, ; 156
	i32 32, ; 157
	i32 219, ; 158
	i32 234, ; 159
	i32 122, ; 160
	i32 72, ; 161
	i32 62, ; 162
	i32 195, ; 163
	i32 161, ; 164
	i32 113, ; 165
	i32 88, ; 166
	i32 232, ; 167
	i32 366, ; 168
	i32 105, ; 169
	i32 18, ; 170
	i32 146, ; 171
	i32 118, ; 172
	i32 58, ; 173
	i32 271, ; 174
	i32 17, ; 175
	i32 367, ; 176
	i32 181, ; 177
	i32 52, ; 178
	i32 200, ; 179
	i32 196, ; 180
	i32 92, ; 181
	i32 240, ; 182
	i32 363, ; 183
	i32 55, ; 184
	i32 368, ; 185
	i32 187, ; 186
	i32 129, ; 187
	i32 152, ; 188
	i32 41, ; 189
	i32 92, ; 190
	i32 206, ; 191
	i32 315, ; 192
	i32 50, ; 193
	i32 333, ; 194
	i32 162, ; 195
	i32 13, ; 196
	i32 289, ; 197
	i32 253, ; 198
	i32 310, ; 199
	i32 36, ; 200
	i32 67, ; 201
	i32 109, ; 202
	i32 254, ; 203
	i32 99, ; 204
	i32 99, ; 205
	i32 11, ; 206
	i32 180, ; 207
	i32 204, ; 208
	i32 178, ; 209
	i32 198, ; 210
	i32 11, ; 211
	i32 188, ; 212
	i32 320, ; 213
	i32 296, ; 214
	i32 25, ; 215
	i32 128, ; 216
	i32 76, ; 217
	i32 288, ; 218
	i32 109, ; 219
	i32 314, ; 220
	i32 312, ; 221
	i32 106, ; 222
	i32 2, ; 223
	i32 26, ; 224
	i32 267, ; 225
	i32 157, ; 226
	i32 359, ; 227
	i32 21, ; 228
	i32 362, ; 229
	i32 49, ; 230
	i32 43, ; 231
	i32 126, ; 232
	i32 257, ; 233
	i32 59, ; 234
	i32 183, ; 235
	i32 119, ; 236
	i32 317, ; 237
	i32 280, ; 238
	i32 266, ; 239
	i32 3, ; 240
	i32 286, ; 241
	i32 189, ; 242
	i32 306, ; 243
	i32 38, ; 244
	i32 124, ; 245
	i32 356, ; 246
	i32 306, ; 247
	i32 0, ; 248
	i32 186, ; 249
	i32 240, ; 250
	i32 356, ; 251
	i32 137, ; 252
	i32 149, ; 253
	i32 369, ; 254
	i32 85, ; 255
	i32 90, ; 256
	i32 290, ; 257
	i32 370, ; 258
	i32 287, ; 259
	i32 344, ; 260
	i32 262, ; 261
	i32 273, ; 262
	i32 318, ; 263
	i32 227, ; 264
	i32 324, ; 265
	i32 288, ; 266
	i32 133, ; 267
	i32 96, ; 268
	i32 3, ; 269
	i32 352, ; 270
	i32 105, ; 271
	i32 355, ; 272
	i32 33, ; 273
	i32 154, ; 274
	i32 158, ; 275
	i32 155, ; 276
	i32 82, ; 277
	i32 197, ; 278
	i32 190, ; 279
	i32 282, ; 280
	i32 247, ; 281
	i32 143, ; 282
	i32 87, ; 283
	i32 19, ; 284
	i32 283, ; 285
	i32 246, ; 286
	i32 51, ; 287
	i32 252, ; 288
	i32 359, ; 289
	i32 61, ; 290
	i32 54, ; 291
	i32 4, ; 292
	i32 198, ; 293
	i32 97, ; 294
	i32 251, ; 295
	i32 17, ; 296
	i32 155, ; 297
	i32 84, ; 298
	i32 29, ; 299
	i32 45, ; 300
	i32 320, ; 301
	i32 64, ; 302
	i32 66, ; 303
	i32 350, ; 304
	i32 172, ; 305
	i32 291, ; 306
	i32 1, ; 307
	i32 327, ; 308
	i32 47, ; 309
	i32 24, ; 310
	i32 259, ; 311
	i32 207, ; 312
	i32 187, ; 313
	i32 165, ; 314
	i32 108, ; 315
	i32 12, ; 316
	i32 285, ; 317
	i32 63, ; 318
	i32 27, ; 319
	i32 23, ; 320
	i32 93, ; 321
	i32 168, ; 322
	i32 12, ; 323
	i32 331, ; 324
	i32 237, ; 325
	i32 29, ; 326
	i32 103, ; 327
	i32 14, ; 328
	i32 126, ; 329
	i32 268, ; 330
	i32 229, ; 331
	i32 300, ; 332
	i32 231, ; 333
	i32 91, ; 334
	i32 289, ; 335
	i32 193, ; 336
	i32 248, ; 337
	i32 9, ; 338
	i32 86, ; 339
	i32 279, ; 340
	i32 312, ; 341
	i32 197, ; 342
	i32 354, ; 343
	i32 71, ; 344
	i32 168, ; 345
	i32 1, ; 346
	i32 299, ; 347
	i32 5, ; 348
	i32 354, ; 349
	i32 44, ; 350
	i32 27, ; 351
	i32 328, ; 352
	i32 158, ; 353
	i32 302, ; 354
	i32 112, ; 355
	i32 364, ; 356
	i32 208, ; 357
	i32 121, ; 358
	i32 205, ; 359
	i32 317, ; 360
	i32 258, ; 361
	i32 196, ; 362
	i32 159, ; 363
	i32 193, ; 364
	i32 131, ; 365
	i32 323, ; 366
	i32 57, ; 367
	i32 179, ; 368
	i32 213, ; 369
	i32 138, ; 370
	i32 83, ; 371
	i32 30, ; 372
	i32 269, ; 373
	i32 10, ; 374
	i32 319, ; 375
	i32 171, ; 376
	i32 182, ; 377
	i32 266, ; 378
	i32 150, ; 379
	i32 94, ; 380
	i32 192, ; 381
	i32 279, ; 382
	i32 176, ; 383
	i32 60, ; 384
	i32 235, ; 385
	i32 157, ; 386
	i32 339, ; 387
	i32 225, ; 388
	i32 64, ; 389
	i32 88, ; 390
	i32 79, ; 391
	i32 47, ; 392
	i32 233, ; 393
	i32 143, ; 394
	i32 336, ; 395
	i32 211, ; 396
	i32 329, ; 397
	i32 273, ; 398
	i32 74, ; 399
	i32 199, ; 400
	i32 91, ; 401
	i32 326, ; 402
	i32 135, ; 403
	i32 90, ; 404
	i32 311, ; 405
	i32 332, ; 406
	i32 270, ; 407
	i32 202, ; 408
	i32 334, ; 409
	i32 112, ; 410
	i32 42, ; 411
	i32 159, ; 412
	i32 244, ; 413
	i32 4, ; 414
	i32 103, ; 415
	i32 176, ; 416
	i32 218, ; 417
	i32 70, ; 418
	i32 60, ; 419
	i32 39, ; 420
	i32 260, ; 421
	i32 153, ; 422
	i32 56, ; 423
	i32 34, ; 424
	i32 224, ; 425
	i32 235, ; 426
	i32 257, ; 427
	i32 21, ; 428
	i32 163, ; 429
	i32 201, ; 430
	i32 217, ; 431
	i32 324, ; 432
	i32 345, ; 433
	i32 322, ; 434
	i32 316, ; 435
	i32 140, ; 436
	i32 185, ; 437
	i32 348, ; 438
	i32 227, ; 439
	i32 89, ; 440
	i32 202, ; 441
	i32 147, ; 442
	i32 272, ; 443
	i32 162, ; 444
	i32 301, ; 445
	i32 6, ; 446
	i32 169, ; 447
	i32 31, ; 448
	i32 107, ; 449
	i32 282, ; 450
	i32 245, ; 451
	i32 346, ; 452
	i32 316, ; 453
	i32 223, ; 454
	i32 255, ; 455
	i32 309, ; 456
	i32 222, ; 457
	i32 167, ; 458
	i32 283, ; 459
	i32 140, ; 460
	i32 342, ; 461
	i32 59, ; 462
	i32 239, ; 463
	i32 144, ; 464
	i32 239, ; 465
	i32 81, ; 466
	i32 74, ; 467
	i32 219, ; 468
	i32 220, ; 469
	i32 130, ; 470
	i32 25, ; 471
	i32 7, ; 472
	i32 93, ; 473
	i32 313, ; 474
	i32 137, ; 475
	i32 249, ; 476
	i32 113, ; 477
	i32 9, ; 478
	i32 243, ; 479
	i32 245, ; 480
	i32 104, ; 481
	i32 19, ; 482
	i32 181, ; 483
	i32 281, ; 484
	i32 186, ; 485
	i32 295, ; 486
	i32 370, ; 487
	i32 275, ; 488
	i32 33, ; 489
	i32 263, ; 490
	i32 46, ; 491
	i32 347, ; 492
	i32 30, ; 493
	i32 264, ; 494
	i32 57, ; 495
	i32 134, ; 496
	i32 114, ; 497
	i32 318, ; 498
	i32 360, ; 499
	i32 330, ; 500
	i32 55, ; 501
	i32 228, ; 502
	i32 6, ; 503
	i32 77, ; 504
	i32 274, ; 505
	i32 191, ; 506
	i32 111, ; 507
	i32 195, ; 508
	i32 278, ; 509
	i32 248, ; 510
	i32 102, ; 511
	i32 334, ; 512
	i32 348, ; 513
	i32 170, ; 514
	i32 115, ; 515
	i32 342, ; 516
	i32 313, ; 517
	i32 268, ; 518
	i32 199, ; 519
	i32 76, ; 520
	i32 325, ; 521
	i32 85, ; 522
	i32 327, ; 523
	i32 362, ; 524
	i32 261, ; 525
	i32 363, ; 526
	i32 346, ; 527
	i32 216, ; 528
	i32 303, ; 529
	i32 160, ; 530
	i32 2, ; 531
	i32 274, ; 532
	i32 24, ; 533
	i32 254, ; 534
	i32 32, ; 535
	i32 117, ; 536
	i32 37, ; 537
	i32 16, ; 538
	i32 341, ; 539
	i32 52, ; 540
	i32 344, ; 541
	i32 328, ; 542
	i32 20, ; 543
	i32 123, ; 544
	i32 204, ; 545
	i32 154, ; 546
	i32 281, ; 547
	i32 131, ; 548
	i32 203, ; 549
	i32 336, ; 550
	i32 263, ; 551
	i32 148, ; 552
	i32 205, ; 553
	i32 173, ; 554
	i32 250, ; 555
	i32 120, ; 556
	i32 28, ; 557
	i32 132, ; 558
	i32 100, ; 559
	i32 134, ; 560
	i32 301, ; 561
	i32 153, ; 562
	i32 97, ; 563
	i32 125, ; 564
	i32 251, ; 565
	i32 69, ; 566
	i32 72, ; 567
	i32 357, ; 568
	i32 286, ; 569
	i32 304, ; 570
	i32 338, ; 571
	i32 136, ; 572
	i32 124, ; 573
	i32 71, ; 574
	i32 111, ; 575
	i32 296, ; 576
	i32 214, ; 577
	i32 152, ; 578
	i32 349, ; 579
	i32 365, ; 580
	i32 325, ; 581
	i32 118, ; 582
	i32 272, ; 583
	i32 177, ; 584
	i32 366, ; 585
	i32 0, ; 586
	i32 333, ; 587
	i32 127, ; 588
	i32 133, ; 589
	i32 215, ; 590
	i32 77, ; 591
	i32 46, ; 592
	i32 275, ; 593
	i32 73, ; 594
	i32 63, ; 595
	i32 98, ; 596
	i32 84, ; 597
	i32 350, ; 598
	i32 43, ; 599
	i32 61, ; 600
	i32 302, ; 601
	i32 210, ; 602
	i32 37, ; 603
	i32 40, ; 604
	i32 265, ; 605
	i32 331, ; 606
	i32 160, ; 607
	i32 98, ; 608
	i32 178, ; 609
	i32 270, ; 610
	i32 215, ; 611
	i32 188, ; 612
	i32 217, ; 613
	i32 135, ; 614
	i32 20, ; 615
	i32 65, ; 616
	i32 337, ; 617
	i32 125, ; 618
	i32 75, ; 619
	i32 200, ; 620
	i32 294, ; 621
	i32 184, ; 622
	i32 164, ; 623
	i32 156, ; 624
	i32 337, ; 625
	i32 5, ; 626
	i32 345, ; 627
	i32 49, ; 628
	i32 308, ; 629
	i32 338, ; 630
	i32 144, ; 631
	i32 213, ; 632
	i32 139, ; 633
	i32 201, ; 634
	i32 100, ; 635
	i32 182, ; 636
	i32 232, ; 637
	i32 123, ; 638
	i32 120, ; 639
	i32 142, ; 640
	i32 39, ; 641
	i32 68, ; 642
	i32 194, ; 643
	i32 226, ; 644
	i32 41, ; 645
	i32 229, ; 646
	i32 164, ; 647
	i32 73, ; 648
	i32 351, ; 649
	i32 165, ; 650
	i32 224, ; 651
	i32 127, ; 652
	i32 280, ; 653
	i32 330, ; 654
	i32 68, ; 655
	i32 169, ; 656
	i32 194, ; 657
	i32 293, ; 658
	i32 267, ; 659
	i32 237, ; 660
	i32 300, ; 661
	i32 151, ; 662
	i32 45, ; 663
	i32 108, ; 664
	i32 241, ; 665
	i32 48, ; 666
	i32 96, ; 667
	i32 231, ; 668
	i32 31, ; 669
	i32 23, ; 670
	i32 166, ; 671
	i32 22, ; 672
	i32 138, ; 673
	i32 78, ; 674
	i32 358, ; 675
	i32 54, ; 676
	i32 293, ; 677
	i32 298, ; 678
	i32 10, ; 679
	i32 256, ; 680
	i32 297, ; 681
	i32 284, ; 682
	i32 212, ; 683
	i32 16, ; 684
	i32 185, ; 685
	i32 365, ; 686
	i32 139, ; 687
	i32 238, ; 688
	i32 13, ; 689
	i32 15, ; 690
	i32 122, ; 691
	i32 220, ; 692
	i32 87, ; 693
	i32 149, ; 694
	i32 22, ; 695
	i32 34, ; 696
	i32 79, ; 697
	i32 343, ; 698
	i32 323, ; 699
	i32 358, ; 700
	i32 147, ; 701
	i32 80, ; 702
	i32 341, ; 703
	i32 177, ; 704
	i32 249, ; 705
	i32 353, ; 706
	i32 42, ; 707
	i32 26, ; 708
	i32 364, ; 709
	i32 295, ; 710
	i32 292, ; 711
	i32 107, ; 712
	i32 110, ; 713
	i32 7, ; 714
	i32 326, ; 715
	i32 222, ; 716
	i32 238, ; 717
	i32 44, ; 718
	i32 175, ; 719
	i32 161, ; 720
	i32 207, ; 721
	i32 148, ; 722
	i32 352, ; 723
	i32 261, ; 724
	i32 297, ; 725
	i32 38, ; 726
	i32 15, ; 727
	i32 246, ; 728
	i32 146, ; 729
	i32 8, ; 730
	i32 278, ; 731
	i32 244, ; 732
	i32 299, ; 733
	i32 130, ; 734
	i32 347, ; 735
	i32 189, ; 736
	i32 174, ; 737
	i32 242, ; 738
	i32 315, ; 739
	i32 247, ; 740
	i32 94 ; 741
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
