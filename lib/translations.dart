import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'search': 'Search in Google', 'files': 'Files', 'starred': 'Starred', 'shared': 'Shared', 'home': 'Home',
      'input_hint': 'Input a name', 'login_title': 'Sign in to continue', 'user': 'Username', 'pass': 'Password',
      'login_btn': 'Login', 'login_error': 'Invalid username or password!', 'events': 'Events', 'add_acc': 'Add Account',
      'downloads': 'Downloads', 'trash': 'Trash', 'spam': 'Spam', 'settings': 'Settings', 'help': 'Help & Feedback',
      'storage': 'Storage', 'storage_info': '1.7 MB of 15 GB used', 'get_more': 'Get extra storage',
    },
    'ar': {
      'search': 'البحث في Google', 'files': 'الملفات', 'starred': 'المميزة', 'shared': 'المشتركة', 'home': 'الرئيسية',
      'input_hint': 'أدخل اسماً', 'login_title': 'تسجيل الدخول للمتابعة', 'user': 'اسم المستخدم', 'pass': 'كلمة المرور',
      'login_btn': 'دخول', 'login_error': 'اسم المستخدم أو كلمة المرور غير صحيحة!', 'events': 'الأحداث', 'add_acc': 'اضافة حساب',
      'downloads': 'عمليات التحميل', 'trash': 'المهملات', 'spam': 'محتوى غير مرغوب فيه', 'settings': 'الاعدادات', 'help': 'المساعدة والملاحظات',
      'storage': 'مساحة التخزين', 'storage_info': 'تم استخدام 1.7 ميغابايت من إجمالي 15 غيغابايت', 'get_more': 'الحصول على مساحة تخزين إضافية',
    }
  };
}