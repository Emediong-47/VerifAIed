# google_mlkit_text_recognition references optional script-specific recognizers
# (Chinese, Devanagari, Japanese, Korean) that we don't bundle; only Latin is used.
-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**

# ML Kit discovers its components (registrars, loggers) via reflection. If R8
# strips or renames them, lookups return null and InputImage.fromFilePath throws
# an NPE in release builds only.
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.internal.mlkit_** { *; }
-keep class com.google_mlkit_** { *; }
-keep class com.google.firebase.components.** { *; }
