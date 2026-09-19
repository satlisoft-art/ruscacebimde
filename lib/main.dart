import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'auth_service.dart';

// ============================================================
// MODELLER
// ============================================================

class WordItem {
  final String russian;
  final String transcription;
  final String turkish;
  final String category;
  final String emoji;

  WordItem({
    required this.russian,
    required this.transcription,
    required this.turkish,
    required this.category,
    required this.emoji,
  });
}

class LessonCategory {
  final String id;
  final String title;
  final String subtitle;
  final String number;
  final List<WordItem> words;

  LessonCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.number,
    required this.words,
  });
}

class DialogLine {
  final String speaker;
  final String russian;
  final String transcription;
  final String turkish;

  DialogLine({
    required this.speaker,
    required this.russian,
    required this.transcription,
    required this.turkish,
  });
}

class DialogTopic {
  final String title;
  final String subtitle;
  final String icon;
  final List<DialogLine> lines;

  DialogTopic({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.lines,
  });
}

// ============================================================
// İÇERİK YÖNETİCİSİ (1000+ KELİME & DİYALOGLAR)
// ============================================================

class ContentManager {
  static final List<LessonCategory> lessons = [
// --------------------------------------------------------
// 1. TEMEL KELİMELER
// --------------------------------------------------------
    LessonCategory(
      id: "temel",
      title: "👋 Temel Kelimeler",
      subtitle: "Günlük hayatta ilk öğrenmen gerekenler",
      number: "01",
      words: [
        WordItem(russian: "До встречи", transcription: "da fstryeçi", turkish: "Görüşmek üzere", emoji: "🤝", category: "Temel"),
        WordItem(russian: "Удачи", transcription: "udaçi", turkish: "Bol şans", emoji: "🍀", category: "Temel"),
        WordItem(russian: "Поздравляю", transcription: "pazdravlyayu", turkish: "Tebrikler", emoji: "🎉", category: "Temel"),
        WordItem(russian: "Добро пожаловать", transcription: "dabro pajalavat", turkish: "Hoş geldiniz", emoji: "🏡", category: "Temel"),
        WordItem(russian: "Конечно", transcription: "kanyeşna", turkish: "Elbette", emoji: "✅", category: "Temel"),
        WordItem(russian: "Разумеется", transcription: "razumyeyetsa", turkish: "Elbette / Tabii ki", emoji: "💯", category: "Temel"),
        WordItem(russian: "Точно", transcription: "toçna", turkish: "Kesinlikle / Aynen", emoji: "🎯", category: "Temel"),
        WordItem(russian: "Наверное", transcription: "navyernaye", turkish: "Muhtemelen", emoji: "🤔", category: "Temel"),
        WordItem(russian: "Возможно", transcription: "vazmojna", turkish: "Mümkün / Belki", emoji: "🤷", category: "Temel"),
        WordItem(russian: "Правда?", transcription: "pravda", turkish: "Gerçekten mi?", emoji: "😲", category: "Temel"),
        WordItem(russian: "Серьёзно?", transcription: "syeryozna", turkish: "Ciddi misin?", emoji: "🤨", category: "Temel"),
        WordItem(russian: "Почему бы и нет?", transcription: "paçyemu bıy i nyet", turkish: "Neden olmasın?", emoji: "🚀", category: "Temel"),
        WordItem(russian: "Не проблема", transcription: "nye prablyema", turkish: "Sorun değil", emoji: "✌️", category: "Temel"),
        WordItem(russian: "Ничего страшного", transcription: "niçyevo straşnava", turkish: "Önemli değil", emoji: "😌", category: "Temel"),
        WordItem(russian: "С удовольствием", transcription: "s udavolstviyem", turkish: "Memnuniyetle", emoji: "😍", category: "Temel"),
        WordItem(russian: "Подожди минуту", transcription: "padajdi minutu", turkish: "Bir dakika bekle", emoji: "⏳", category: "Temel"),
        WordItem(russian: "Одну минуту", transcription: "adnu minutu", turkish: "Bir dakika", emoji: "☝️", category: "Temel"),
        WordItem(russian: "Я хочу", transcription: "ya haçu", turkish: "İstiyorum", emoji: "🙋", category: "Temel"),
        WordItem(russian: "Я могу", transcription: "ya magu", turkish: "Yapabilirim", emoji: "💪", category: "Temel"),
        WordItem(russian: "Я не могу", transcription: "ya nye magu", turkish: "Yapamam", emoji: "🚫", category: "Temel"),
        WordItem(russian: "Я должен", transcription: "ya doljyen", turkish: "Yapmalıyım (erkek)", emoji: "⚠️", category: "Temel"),
        WordItem(russian: "Мне нужно", transcription: "mnye nujna", turkish: "Gerekiyor / İhtiyacım var", emoji: "📌", category: "Temel"),
        WordItem(russian: "Я готов", transcription: "ya gatof", turkish: "Hazırım (erkek)", emoji: "🏃‍♂️", category: "Temel"),
        WordItem(russian: "Я готова", transcription: "ya gatova", turkish: "Hazırım (kadın)", emoji: "🏃‍♀️", category: "Temel"),
        WordItem(russian: "Я устал", transcription: "ya ustal", turkish: "Yorgunum (erkek)", emoji: "😫", category: "Temel"),
        WordItem(russian: "Я устала", transcription: "ya ustala", turkish: "Yorgunum (kadın)", emoji: "😩", category: "Temel"),
        WordItem(russian: "Всё хорошо", transcription: "fsyo haraşo", turkish: "Her şey yolunda", emoji: "👍", category: "Temel"),
        WordItem(russian: "Согласен", transcription: "saglasyen", turkish: "Katılıyorum (erkek)", emoji: "🤝", category: "Temel"),
        WordItem(russian: "Согласна", transcription: "saglasna", turkish: "Katılıyorum (kadın)", emoji: "🤝", category: "Temel"),
        WordItem(russian: "Не согласен", transcription: "nye saglasyen", turkish: "Katılmıyorum (erkek)", emoji: "🙅‍♂️", category: "Temel"),
        WordItem(russian: "Мой", transcription: "moy", turkish: "Benim (eril)", emoji: "🙋‍♂️", category: "Temel"),
        WordItem(russian: "Моя", transcription: "maya", turkish: "Benim (dişil)", emoji: "🙋‍♀️", category: "Temel"),
        WordItem(russian: "Моё", transcription: "mayo", turkish: "Benim (nötr)", emoji: "📦", category: "Temel"),
        WordItem(russian: "Твой", transcription: "tvoy", turkish: "Senin (eril)", emoji: "👉", category: "Temel"),
        WordItem(russian: "Твоя", transcription: "tvaya", turkish: "Senin (dişil)", emoji: "👉", category: "Temel"),
        WordItem(russian: "Этот", transcription: "etot", turkish: "Bu (eril)", emoji: "👇", category: "Temel"),
        WordItem(russian: "Эта", transcription: "eta", turkish: "Bu (dişil)", emoji: "👇", category: "Temel"),
        WordItem(russian: "Это", transcription: "eta", turkish: "Bu / Bu şey", emoji: "📍", category: "Temel"),
        WordItem(russian: "И", transcription: "i", turkish: "Ve", emoji: "➕", category: "Temel"),
        WordItem(russian: "Или", transcription: "ili", turkish: "Veya", emoji: "🔀", category: "Temel"),
        WordItem(russian: "Но", transcription: "no", turkish: "Ama", emoji: "✋", category: "Temel"),
        WordItem(russian: "Если", transcription: "yesli", turkish: "Eğer", emoji: "❓", category: "Temel"),
        WordItem(russian: "Тоже", transcription: "tojye", turkish: "De / Da", emoji: "👯", category: "Temel"),
        WordItem(russian: "Ещё", transcription: "yeşço", turkish: "Daha / Başka", emoji: "🔄", category: "Temel"),
        WordItem(russian: "Уже", transcription: "ujye", turkish: "Zaten / Artık", emoji: "⏩", category: "Temel"),
        WordItem(russian: "Только", transcription: "tolka", turkish: "Sadece", emoji: "🤏", category: "Temel"),
        WordItem(russian: "Опять", transcription: "apyat", turkish: "Yine / Tekrar", emoji: "🔁", category: "Temel"),
        WordItem(russian: "Вместе", transcription: "vmyestye", turkish: "Birlikte", emoji: "🫂", category: "Temel"),
        WordItem(russian: "Отдельно", transcription: "atdyelna", turkish: "Ayrı", emoji: "↔️", category: "Temel"),
        WordItem(russian: "Рядом", transcription: "ryadam", turkish: "Yanında / Yakında", emoji: "🧍🧍", category: "Temel"),
        WordItem(russian: "Далеко", transcription: "dalyeko", turkish: "Uzak", emoji: "🔭", category: "Temel"),
        WordItem(russian: "Близко", transcription: "bliska", turkish: "Yakın", emoji: "🔍", category: "Temel"),
        WordItem(russian: "Каждый", transcription: "kajdıy", turkish: "Her biri / Her", emoji: "♾️", category: "Temel"),
        WordItem(russian: "Другой", transcription: "drugoy", turkish: "Başka / Diğer", emoji: "👽", category: "Temel"),
        WordItem(russian: "Новый", transcription: "novıy", turkish: "Yeni", emoji: "🆕", category: "Temel"),
        WordItem(russian: "Старый", transcription: "starıy", turkish: "Eski / Yaşlı", emoji: "🕰️", category: "Temel"),
        WordItem(russian: "Первый", transcription: "pyervıy", turkish: "İlk / Birinci", emoji: "🥇", category: "Temel"),
        WordItem(russian: "Последний", transcription: "paslyedniy", turkish: "Son / Sonuncu", emoji: "🏁", category: "Temel"),
      ],
    ),

// --------------------------------------------------------
// 2. EV & YAŞAM
// --------------------------------------------------------
    LessonCategory(
      id: "ev",
      title: "🏠 Ev & Yaşam",
      subtitle: "Evde ve günlük yaşamda kullanılan kelimeler",
      number: "02",
      words: [
        WordItem(russian: "Коридор", transcription: "karidor", turkish: "Koridor", emoji: "🚪", category: "Ev"),
        WordItem(russian: "Гости", transcription: "gosti", turkish: "Misafirler", emoji: "👥", category: "Ev"),
        WordItem(russian: "Кабинет", transcription: "kabinyet", turkish: "Çalışma odası / Ofis", emoji: "💻", category: "Ev"),
        WordItem(russian: "Кладовка", transcription: "kladofka", turkish: "Kiler / Depo", emoji: "📦", category: "Ev"),
        WordItem(russian: "Гараж", transcription: "garaj", turkish: "Garaj", emoji: "🚘", category: "Ev"),
        WordItem(russian: "Сад", transcription: "sat", turkish: "Bahçe", emoji: "🌳", category: "Ev"),
        WordItem(russian: "Двор", transcription: "dvor", turkish: "Avlu / Bahçe", emoji: "🏡", category: "Ev"),
        WordItem(russian: "Мебель", transcription: "myebyel", turkish: "Mobilya", emoji: "🛋️", category: "Ev"),
        WordItem(russian: "Полка", transcription: "polka", turkish: "Raf", emoji: "📚", category: "Ev"),
        WordItem(russian: "Шкаф", transcription: "şkaf", turkish: "Dolap", emoji: "🗄️", category: "Ev"),
        WordItem(russian: "Ящик", transcription: "yaşçik", turkish: "Çekmece / Kutu", emoji: "🗃️", category: "Ev"),
        WordItem(russian: "Подушка", transcription: "paduşka", turkish: "Yastık", emoji: "🛏️", category: "Ev"),
        WordItem(russian: "Одеяло", transcription: "adiyala", turkish: "Battaniye", emoji: "🛌", category: "Ev"),
        WordItem(russian: "Простыня", transcription: "prastınya", turkish: "Çarşaf", emoji: "🛏️", category: "Ev"),
        WordItem(russian: "Полотенце", transcription: "palatyentse", turkish: "Havlu", emoji: "🧖‍♀️", category: "Ev"),
        WordItem(russian: "Мыло", transcription: "mıla", turkish: "Sabun", emoji: "🧼", category: "Ev"),
        WordItem(russian: "Шампунь", transcription: "şampun", turkish: "Şampuan", emoji: "🧴", category: "Ev"),
        WordItem(russian: "Зубная щётка", transcription: "zubnaya şçotka", turkish: "Diş fırçası", emoji: "🪥", category: "Ev"),
        WordItem(russian: "Зубная паста", transcription: "zubnaya pasta", turkish: "Diş macunu", emoji: "🦷", category: "Ev"),
        WordItem(russian: "Тарелка", transcription: "taryelka", turkish: "Tabak", emoji: "🍽️", category: "Ev"),
        WordItem(russian: "Чашка", transcription: "çaşka", turkish: "Fincan", emoji: "☕", category: "Ev"),
        WordItem(russian: "Стакан", transcription: "stakan", turkish: "Bardak", emoji: "🥛", category: "Ev"),
        WordItem(russian: "Ложка", transcription: "loşka", turkish: "Kaşık", emoji: "🥄", category: "Ev"),
        WordItem(russian: "Вилка", transcription: "vilka", turkish: "Çatal", emoji: "🍴", category: "Ev"),
        WordItem(russian: "Нож", transcription: "noj", turkish: "Bıçak", emoji: "🔪", category: "Ev"),
        WordItem(russian: "Кастрюля", transcription: "kastryulya", turkish: "Tencere", emoji: "🍲", category: "Ev"),
        WordItem(russian: "Сковорода", transcription: "skavarada", turkish: "Tava", emoji: "🍳", category: "Ev"),
        WordItem(russian: "Чайник", transcription: "çaynik", turkish: "Çaydanlık / Kettle", emoji: "🫖", category: "Ev"),
        WordItem(russian: "Морозильник", transcription: "marazilnik", turkish: "Dondurucu", emoji: "🧊", category: "Ev"),
        WordItem(russian: "Посуда", transcription: "pasuda", turkish: "Mutfak eşyaları", emoji: "🍽️", category: "Ev"),
        WordItem(russian: "Мусорное ведро", transcription: "musarnaye vyedro", turkish: "Çöp kutusu", emoji: "🗑️", category: "Ev"),
        WordItem(russian: "Утюг", transcription: "utyuk", turkish: "Ütü", emoji: "🧺", category: "Ev"),
        WordItem(russian: "Одежда", transcription: "adyejda", turkish: "Kıyafet", emoji: "👗", category: "Ev"),
        WordItem(russian: "Рубашка", transcription: "rubaşka", turkish: "Gömlek", emoji: "👔", category: "Ev"),
        WordItem(russian: "Брюки", transcription: "bryuki", turkish: "Pantolon", emoji: "👖", category: "Ev"),
        WordItem(russian: "Обувь", transcription: "obuf", turkish: "Ayakkabı", emoji: "👞", category: "Ev"),
        WordItem(russian: "Куртка", transcription: "kurtka", turkish: "Mont / Ceket", emoji: "🧥", category: "Ev"),
        WordItem(russian: "Носки", transcription: "naski", turkish: "Çorap", emoji: "🧦", category: "Ev"),
        WordItem(russian: "Замок", transcription: "zamok", turkish: "Kilit", emoji: "🔒", category: "Ev"),
        WordItem(russian: "Зарядка", transcription: "zaryatka", turkish: "Şarj cihazı", emoji: "🔌", category: "Ev"),
        WordItem(russian: "Розетка", transcription: "razyetka", turkish: "Priz", emoji: "🔌", category: "Ev"),
        WordItem(russian: "Выключатель", transcription: "vıklyuçatyel", turkish: "Elektrik düğmesi", emoji: "💡", category: "Ev"),
        WordItem(russian: "Батарея", transcription: "bataryeya", turkish: "Petek / Kalorifer", emoji: "♨️", category: "Ev"),
        WordItem(russian: "Отопление", transcription: "ataplyeniye", turkish: "Isıtma", emoji: "🔥", category: "Ev"),
        WordItem(russian: "Кондиционер", transcription: "kanditsanyer", turkish: "Klima", emoji: "❄️", category: "Ev"),
        WordItem(russian: "Ремонт", transcription: "ryemont", turkish: "Tadilat / Tamirat", emoji: "🛠️", category: "Ev"),
        WordItem(russian: "Ремонтировать", transcription: "ryemontiravat", turkish: "Tamir etmek", emoji: "🔧", category: "Ev"),
        WordItem(russian: "Ломаться", transcription: "lamattsa", turkish: "Bozulmak / Kırılmak", emoji: "💔", category: "Ev"),
        WordItem(russian: "Сломанный", transcription: "slamannıy", turkish: "Bozuk / Kırık", emoji: "🏚️", category: "Ev"),
        WordItem(russian: "Открытый", transcription: "atkrıtıy", turkish: "Açık", emoji: "🔓", category: "Ev"),
        WordItem(russian: "Закрытый", transcription: "zakrıtıy", turkish: "Kapalı", emoji: "🔐", category: "Ev"),
        WordItem(russian: "Вход", transcription: "fhot", turkish: "Giriş", emoji: "🚪", category: "Ev"),
        WordItem(russian: "Выход", transcription: "vıhat", turkish: "Çıkış", emoji: "🏃‍♂️", category: "Ev"),
      ],
    ),

// --------------------------------------------------------
// 3. AİLE & İNSANLAR
// --------------------------------------------------------
    LessonCategory(
      id: "aile",
      title: "👨‍👩‍👧 Aile & İnsanlar",
      subtitle: "İnsanları ve yakınlarını tanımla",
      number: "03",
      words: [
        WordItem(russian: "Родители", transcription: "radityeli", turkish: "Ebeveynler", emoji: "👫", category: "Aile"),
        WordItem(russian: "Сын", transcription: "sın", turkish: "Oğul", emoji: "👦", category: "Aile"),
        WordItem(russian: "Дочь", transcription: "doç", turkish: "Kız evlat", emoji: "👧", category: "Aile"),
        WordItem(russian: "Дедушка", transcription: "dyeduşka", turkish: "Dede", emoji: "👴", category: "Aile"),
        WordItem(russian: "Бабушка", transcription: "babuşka", turkish: "Büyükanne / Nine", emoji: "👵", category: "Aile"),
        WordItem(russian: "Внук", transcription: "vnuk", turkish: "Erkek torun", emoji: "🧒", category: "Aile"),
        WordItem(russian: "Внучка", transcription: "vnuçka", turkish: "Kız torun", emoji: "👧", category: "Aile"),
        WordItem(russian: "Дядя", transcription: "dyadya", turkish: "Amca / Dayı", emoji: "👨", category: "Aile"),
        WordItem(russian: "Тётя", transcription: "tyotya", turkish: "Teyze / Hala", emoji: "👩", category: "Aile"),
        WordItem(russian: "Двоюродный брат", transcription: "dvayurodnıy brat", turkish: "Erkek kuzen", emoji: "👱‍♂️", category: "Aile"),
        WordItem(russian: "Двоюродная сестра", transcription: "dvayurodnaya syestra", turkish: "Kız kuzen", emoji: "👱‍♀️", category: "Aile"),
        WordItem(russian: "Родственник", transcription: "rotstvyennik", turkish: "Erkek akraba", emoji: "🫂", category: "Aile"),
        WordItem(russian: "Родственница", transcription: "rotstvyennitsa", turkish: "Kadın akraba", emoji: "🫂", category: "Aile"),
        WordItem(russian: "Жених", transcription: "jenih", turkish: "Damat adayı / Nişanlı erkek", emoji: "🤵", category: "Aile"),
        WordItem(russian: "Невеста", transcription: "nyevyesta", turkish: "Gelin adayı / Nişanlı kadın", emoji: "👰‍♀️", category: "Aile"),
        WordItem(russian: "Супруг", transcription: "supruk", turkish: "Eş / Koca", emoji: "👨‍💼", category: "Aile"),
        WordItem(russian: "Супруга", transcription: "supruga", turkish: "Eş / Karı", emoji: "👩‍💼", category: "Aile"),
        WordItem(russian: "Отец", transcription: "atyets", turkish: "Baba", emoji: "👨‍🍼", category: "Aile"),
        WordItem(russian: "Мать", transcription: "mat", turkish: "Anne", emoji: "👩‍🍼", category: "Aile"),
        WordItem(russian: "Младший брат", transcription: "mlatşiy brat", turkish: "Küçük erkek kardeş", emoji: "👦", category: "Aile"),
        WordItem(russian: "Старший брат", transcription: "starşiy brat", turkish: "Büyük erkek kardeş", emoji: "👨", category: "Aile"),
        WordItem(russian: "Младшая сестра", transcription: "mlatşaya syestra", turkish: "Küçük kız kardeş", emoji: "👧", category: "Aile"),
        WordItem(russian: "Старшая сестра", transcription: "starşaya syestra", turkish: "Büyük kız kardeş", emoji: "👩", category: "Aile"),
        WordItem(russian: "Близкий человек", transcription: "bliskiy çelavyek", turkish: "Yakın kişi", emoji: "🥰", category: "Aile"),
        WordItem(russian: "Знакомый", transcription: "znakomıy", turkish: "Tanıdık (erkek)", emoji: "👋", category: "Aile"),
        WordItem(russian: "Знакомая", transcription: "znakomaya", turkish: "Tanıdık (kadın)", emoji: "👋", category: "Aile"),
        WordItem(russian: "Лучший друг", transcription: "luçşiy druk", turkish: "En iyi arkadaş", emoji: "🤝", category: "Aile"),
        WordItem(russian: "Друг детства", transcription: "druk dyetstva", turkish: "Çocukluk arkadaşı", emoji: "🚸", category: "Aile"),
        WordItem(russian: "Сосед", transcription: "sasyet", turkish: "Erkek komşu", emoji: "🏠", category: "Aile"),
        WordItem(russian: "Соседка", transcription: "sasyetka", turkish: "Kadın komşu", emoji: "🏡", category: "Aile"),
        WordItem(russian: "Коллега", transcription: "kallyega", turkish: "İş arkadaşı", emoji: "💼", category: "Aile"),
        WordItem(russian: "Начальник", transcription: "naçalnik", turkish: "Patron / Yönetici", emoji: "👔", category: "Aile"),
        WordItem(russian: "Начальница", transcription: "naçalnitsa", turkish: "Kadın yönetici", emoji: "👗", category: "Aile"),
        WordItem(russian: "Человек", transcription: "çelavyek", turkish: "İnsan", emoji: "🚶", category: "Aile"),
        WordItem(russian: "Люди", transcription: "lyudi", turkish: "İnsanlar", emoji: "👥", category: "Aile"),
        WordItem(russian: "Взрослый", transcription: "vzroslıy", turkish: "Yetişkin", emoji: "🧑", category: "Aile"),
        WordItem(russian: "Подросток", transcription: "padrastok", turkish: "Ergen", emoji: "🛹", category: "Aile"),
        WordItem(russian: "Младенец", transcription: "mladyenyets", turkish: "Bebek", emoji: "👶", category: "Aile"),
        WordItem(russian: "Пара", transcription: "para", turkish: "Çift", emoji: "💑", category: "Aile"),
        WordItem(russian: "Брак", transcription: "brak", turkish: "Evlilik", emoji: "💍", category: "Aile"),
        WordItem(russian: "Свадьба", transcription: "svatba", turkish: "Düğün", emoji: "💒", category: "Aile"),
        WordItem(russian: "Женат", transcription: "jenat", turkish: "Evli (erkek)", emoji: "🤵", category: "Aile"),
        WordItem(russian: "Замужем", transcription: "zamujyem", turkish: "Evli (kadın)", emoji: "👰", category: "Aile"),
        WordItem(russian: "Холостой", transcription: "halastoy", turkish: "Bekar (erkek)", emoji: "🕺", category: "Aile"),
        WordItem(russian: "Незамужняя", transcription: "nyezamujnyaya", turkish: "Bekar (kadın)", emoji: "💃", category: "Aile"),
        WordItem(russian: "Разведён", transcription: "razvyedyon", turkish: "Boşanmış (erkek)", emoji: "💔", category: "Aile"),
        WordItem(russian: "Разведена", transcription: "razvyedyena", turkish: "Boşanmış (kadın)", emoji: "💔", category: "Aile"),
        WordItem(russian: "Заботиться", transcription: "zabotitsa", turkish: "İlgilenmek / Özen göstermek", emoji: "🫂", category: "Aile"),
        WordItem(russian: "Уважать", transcription: "uvajat", turkish: "Saygı duymak", emoji: "🫡", category: "Aile"),
        WordItem(russian: "Помогать", transcription: "pamagat", turkish: "Yardım etmek", emoji: "🤝", category: "Aile"),
        WordItem(russian: "Встречаться", transcription: "fstryeçatsa", turkish: "Görüşmek / Buluşmak", emoji: "☕", category: "Aile"),
        WordItem(russian: "Общаться", transcription: "apşçatsa", turkish: "İletişim kurmak", emoji: "🗣️", category: "Aile"),
        WordItem(russian: "Знакомиться", transcription: "znakomitsa", turkish: "Tanışmak", emoji: "🙋‍♂️", category: "Aile"),
        WordItem(russian: "Приглашать", transcription: "priglaşat", turkish: "Davet etmek", emoji: "💌", category: "Aile"),
        WordItem(russian: "Приглашение", transcription: "priglaşyeniye", turkish: "Davet", emoji: "📨", category: "Aile"),
        WordItem(russian: "Подарок", transcription: "padarak", turkish: "Hediye", emoji: "🎁", category: "Aile"),
        WordItem(russian: "День рождения", transcription: "dyen rajdyeniya", turkish: "Doğum günü", emoji: "🎂", category: "Aile"),
        WordItem(russian: "Праздник", transcription: "praznik", turkish: "Bayram / Kutlama", emoji: "🥳", category: "Aile"),
      ],
    ),

// --------------------------------------------------------
// 4. YİYECEK & İÇECEK
// --------------------------------------------------------
    LessonCategory(
      id: "yemek",
      title: "🍔 Yiyecek & İçecek",
      subtitle: "Restoran, kafe ve markette işine yarar",
      number: "04",
      words: [
        WordItem(russian: "Завтрак", transcription: "zaftrak", turkish: "Kahvaltı", emoji: "🥞", category: "Yemek"),
        WordItem(russian: "Обед", transcription: "abyet", turkish: "Öğle yemeği", emoji: "🍱", category: "Yemek"),
        WordItem(russian: "Ужин", transcription: "ujın", turkish: "Akşam yemeği", emoji: "🍝", category: "Yemek"),
        WordItem(russian: "Напиток", transcription: "napitak", turkish: "İçecek", emoji: "🥤", category: "Yemek"),
        WordItem(russian: "Молоко", transcription: "malako", turkish: "Süt", emoji: "🥛", category: "Yemek"),
        WordItem(russian: "Сок", transcription: "sok", turkish: "Meyve suyu", emoji: "🧃", category: "Yemek"),
        WordItem(russian: "Пиво", transcription: "piva", turkish: "Bira", emoji: "🍺", category: "Yemek"),
        WordItem(russian: "Вино", transcription: "vino", turkish: "Şarap", emoji: "🍷", category: "Yemek"),
        WordItem(russian: "Сыр", transcription: "sır", turkish: "Peynir", emoji: "🧀", category: "Yemek"),
        WordItem(russian: "Масло", transcription: "masla", turkish: "Tereyağı / Yağ", emoji: "🧈", category: "Yemek"),
        WordItem(russian: "Яйцо", transcription: "yaytso", turkish: "Yumurta", emoji: "🥚", category: "Yemek"),
        WordItem(russian: "Курица", transcription: "kuritsa", turkish: "Tavuk", emoji: "🍗", category: "Yemek"),
        WordItem(russian: "Свинина", transcription: "svinina", turkish: "Domuz eti", emoji: "🥓", category: "Yemek"),
        WordItem(russian: "Говядина", transcription: "gavyadina", turkish: "Sığır eti", emoji: "🥩", category: "Yemek"),
        WordItem(russian: "Картошка", transcription: "kartoşka", turkish: "Patates", emoji: "🥔", category: "Yemek"),
        WordItem(russian: "Помидор", transcription: "pamidor", turkish: "Domates", emoji: "🍅", category: "Yemek"),
        WordItem(russian: "Огурец", transcription: "aguryets", turkish: "Salatalık", emoji: "🥒", category: "Yemek"),
        WordItem(russian: "Лук", transcription: "luk", turkish: "Soğan", emoji: "🧅", category: "Yemek"),
        WordItem(russian: "Морковь", transcription: "markof", turkish: "Havuç", emoji: "🥕", category: "Yemek"),
        WordItem(russian: "Картофель", transcription: "kartofyel", turkish: "Patates", emoji: "🥔", category: "Yemek"),
        WordItem(russian: "Фрукты", transcription: "fruktı", turkish: "Meyveler", emoji: "🍎", category: "Yemek"),
        WordItem(russian: "Овощи", transcription: "ovaşçi", turkish: "Sebzeler", emoji: "🥦", category: "Yemek"),
        WordItem(russian: "Апельсин", transcription: "apyelsin", turkish: "Portakal", emoji: "🍊", category: "Yemek"),
        WordItem(russian: "Банан", transcription: "banan", turkish: "Muz", emoji: "🍌", category: "Yemek"),
        WordItem(russian: "Виноград", transcription: "vinagrat", turkish: "Üzüm", emoji: "🍇", category: "Yemek"),
        WordItem(russian: "Арбуз", transcription: "arbus", turkish: "Karpuz", emoji: "🍉", category: "Yemek"),
        WordItem(russian: "Клубника", transcription: "klubnika", turkish: "Çilek", emoji: "🍓", category: "Yemek"),
        WordItem(russian: "Соль", transcription: "sol", turkish: "Tuz", emoji: "🧂", category: "Yemek"),
        WordItem(russian: "Сахар", transcription: "sahar", turkish: "Şeker", emoji: "🍬", category: "Yemek"),
        WordItem(russian: "Перец", transcription: "pyeryets", turkish: "Biber", emoji: "🌶️", category: "Yemek"),
        WordItem(russian: "Вкусный", transcription: "fkusnıy", turkish: "Lezzetli", emoji: "😋", category: "Yemek"),
        WordItem(russian: "Невкусный", transcription: "nyefkusnıy", turkish: "Lezzetsiz", emoji: "🤢", category: "Yemek"),
        WordItem(russian: "Сладкий", transcription: "slatkiy", turkish: "Tatlı", emoji: "🧁", category: "Yemek"),
        WordItem(russian: "Горький", transcription: "gorkiy", turkish: "Acı / Ekşi", emoji: "🍋", category: "Yemek"),
        WordItem(russian: "Горячий", transcription: "garyaçiy", turkish: "Sıcak", emoji: "🔥", category: "Yemek"),
        WordItem(russian: "Холодный", transcription: "halodnıy", turkish: "Soğuk", emoji: "❄️", category: "Yemek"),
        WordItem(russian: "Свежий", transcription: "svyejiy", turkish: "Taze", emoji: "🌱", category: "Yemek"),
        WordItem(russian: "Голодный", transcription: "galodnıy", turkish: "Aç", emoji: "🤤", category: "Yemek"),
        WordItem(russian: "Сытый", transcription: "sıtıy", turkish: "Tok", emoji: "😌", category: "Yemek"),
        WordItem(russian: "Есть", transcription: "yest", turkish: "Yemek yemek", emoji: "🍽️", category: "Yemek"),
        WordItem(russian: "Пить", transcription: "pit", turkish: "İçmek", emoji: "🥤", category: "Yemek"),
        WordItem(russian: "Готовить", transcription: "gatovit", turkish: "Yemek pişirmek", emoji: "👨‍🍳", category: "Yemek"),
        WordItem(russian: "Заказывать", transcription: "zakazıvat", turkish: "Sipariş vermek", emoji: "📝", category: "Yemek"),
        WordItem(russian: "Блюдо", transcription: "blyuda", turkish: "Yemek / Porsiyon", emoji: "🍛", category: "Yemek"),
        WordItem(russian: "Десерт", transcription: "dyesyert", turkish: "Tatlı", emoji: "🍰", category: "Yemek"),
        WordItem(russian: "Мороженое", transcription: "marojenaye", turkish: "Dondurma", emoji: "🍦", category: "Yemek"),
        WordItem(russian: "Торт", transcription: "tort", turkish: "Pasta", emoji: "🎂", category: "Yemek"),
        WordItem(russian: "Шоколад", transcription: "şakalat", turkish: "Çikolata", emoji: "🍫", category: "Yemek"),
        WordItem(russian: "Конфета", transcription: "kanfyeta", turkish: "Şekerleme", emoji: "🍬", category: "Yemek"),
        WordItem(russian: "Булка", transcription: "bulka", turkish: "Ekmek / Sandviç ekmeği", emoji: "🥖", category: "Yemek"),
        WordItem(russian: "Сырный", transcription: "sırnıy", turkish: "Peynirli", emoji: "🧀", category: "Yemek"),
        WordItem(russian: "Куриный", transcription: "kurinıy", turkish: "Tavuklu", emoji: "🍗", category: "Yemek"),
      ],
    ),

// --------------------------------------------------------
// 5. ALIŞVERİŞ
// --------------------------------------------------------
    LessonCategory(
      id: "alisveris",
      title: "🛒 Alışveriş",
      subtitle: "Mağaza ve alışveriş konuşmaları",
      number: "05",
      words: [
        WordItem(russian: "Покупка", transcription: "pakupka", turkish: "Alışveriş / Satın alma", emoji: "🛍️", category: "Alışveriş"),
        WordItem(russian: "Покупатель", transcription: "pakupatyel", turkish: "Müşteri / Alıcı", emoji: "🛒", category: "Alışveriş"),
        WordItem(russian: "Продавец", transcription: "pradavyets", turkish: "Satıcı", emoji: "🏪", category: "Alışveriş"),
        WordItem(russian: "Товар", transcription: "tavar", turkish: "Ürün / Mal", emoji: "📦", category: "Alışveriş"),
        WordItem(russian: "Корзина", transcription: "karzina", turkish: "Sepet", emoji: "🧺", category: "Alışveriş"),
        WordItem(russian: "Чек", transcription: "çek", turkish: "Fiş / Makbuz", emoji: "🧾", category: "Alışveriş"),
        WordItem(russian: "Скидка", transcription: "skitka", turkish: "İndirim", emoji: "🏷️", category: "Alışveriş"),
        WordItem(russian: "Распродажа", transcription: "raspradaja", turkish: "İndirimli satış", emoji: "🔥", category: "Alışveriş"),
        WordItem(russian: "Бесплатно", transcription: "byesplatna", turkish: "Ücretsiz", emoji: "🆓", category: "Alışveriş"),
        WordItem(russian: "Доступный", transcription: "dastupnıy", turkish: "Uygun fiyatlı", emoji: "💸", category: "Alışveriş"),
        WordItem(russian: "Качество", transcription: "kaçyestva", turkish: "Kalite", emoji: "⭐", category: "Alışveriş"),
        WordItem(russian: "Хорошего качества", transcription: "haroşeva kaçyestva", turkish: "Kaliteli", emoji: "🌟", category: "Alışveriş"),
        WordItem(russian: "Выбирать", transcription: "vıbirat", turkish: "Seçmek", emoji: "🤔", category: "Alışveriş"),
        WordItem(russian: "Выбрать", transcription: "vıbrat", turkish: "Seçmek", emoji: "🎯", category: "Alışveriş"),
        WordItem(russian: "Покупать", transcription: "pakupat", turkish: "Satın almak", emoji: "🛍️", category: "Alışveriş"),
        WordItem(russian: "Купить", transcription: "kupit", turkish: "Satın almak", emoji: "✅", category: "Alışveriş"),
        WordItem(russian: "Продавать", transcription: "pradavat", turkish: "Satmak", emoji: "💰", category: "Alışveriş"),
        WordItem(russian: "Платить", transcription: "platit", turkish: "Ödemek", emoji: "💳", category: "Alışveriş"),
        WordItem(russian: "Заплатить", transcription: "zaplatit", turkish: "Ödemek", emoji: "💲", category: "Alışveriş"),
        WordItem(russian: "Наличные", transcription: "naliçnıye", turkish: "Nakit para", emoji: "💵", category: "Alışveriş"),
        WordItem(russian: "Карта", transcription: "karta", turkish: "Kart", emoji: "💳", category: "Alışveriş"),
        WordItem(russian: "Банковская карта", transcription: "bankafskaya karta", turkish: "Banka kartı", emoji: "🏦", category: "Alışveriş"),
        WordItem(russian: "Кредитная карта", transcription: "kryeditnaya karta", turkish: "Kredi kartı", emoji: "💳", category: "Alışveriş"),
        WordItem(russian: "Сумка", transcription: "sumka", turkish: "Çanta", emoji: "👜", category: "Alışveriş"),
        WordItem(russian: "Пакет", transcription: "pakyet", turkish: "Poşet / Paket", emoji: "🛍️", category: "Alışveriş"),
        WordItem(russian: "Цвет", transcription: "tsvyet", turkish: "Renk", emoji: "🎨", category: "Alışveriş"),
        WordItem(russian: "Красный", transcription: "krasnıy", turkish: "Kırmızı", emoji: "🔴", category: "Alışveriş"),
        WordItem(russian: "Синий", transcription: "siniy", turkish: "Mavi", emoji: "🔵", category: "Alışveriş"),
        WordItem(russian: "Зелёный", transcription: "zyelyonıy", turkish: "Yeşil", emoji: "🟢", category: "Alışveriş"),
        WordItem(russian: "Белый", transcription: "byelıy", turkish: "Beyaz", emoji: "⚪", category: "Alışveriş"),
        WordItem(russian: "Чёрный", transcription: "çornıy", turkish: "Siyah", emoji: "⚫", category: "Alışveriş"),
        WordItem(russian: "Жёлтый", transcription: "joltıy", turkish: "Sarı", emoji: "🟡", category: "Alışveriş"),
        WordItem(russian: "Серый", transcription: "syerıy", turkish: "Gri", emoji: "🔘", category: "Alışveriş"),
        WordItem(russian: "Розовый", transcription: "rozavıy", turkish: "Pembe", emoji: "🩷", category: "Alışveriş"),
        WordItem(russian: "Круглый", transcription: "kruglıy", turkish: "Yuvarlak", emoji: "⭕", category: "Alışveriş"),
        WordItem(russian: "Длинный", transcription: "dlinnıy", turkish: "Uzun", emoji: "📏", category: "Alışveriş"),
        WordItem(russian: "Короткий", transcription: "karotkiy", turkish: "Kısa", emoji: "📐", category: "Alışveriş"),
        WordItem(russian: "Тяжёлый", transcription: "tyajolıy", turkish: "Ağır", emoji: "🏋️", category: "Alışveriş"),
        WordItem(russian: "Лёгкий", transcription: "lyohkiy", turkish: "Hafif", emoji: "🪶", category: "Alışveriş"),
        WordItem(russian: "Подходит", transcription: "pathodit", turkish: "Uygun / Oluyor", emoji: "👍", category: "Alışveriş"),
        WordItem(russian: "Не подходит", transcription: "nye pathodit", turkish: "Uygun değil", emoji: "👎", category: "Alışveriş"),
        WordItem(russian: "Примерить", transcription: "primyerit", turkish: "Denemek (kıyafet)", emoji: "👕", category: "Alışveriş"),
        WordItem(russian: "Примерочная", transcription: "primyeraçnaya", turkish: "Deneme kabini", emoji: "🚪", category: "Alışveriş"),
        WordItem(russian: "Оригинальный", transcription: "ariginalnıy", turkish: "Orijinal", emoji: "💎", category: "Alışveriş"),
        WordItem(russian: "Подделка", transcription: "padyelka", turkish: "Sahte ürün", emoji: "🎭", category: "Alışveriş"),
        WordItem(russian: "Гарантия", transcription: "garantiya", turkish: "Garanti", emoji: "🛡️", category: "Alışveriş"),
        WordItem(russian: "Возврат", transcription: "vazvrat", turkish: "İade", emoji: "↩️", category: "Alışveriş"),
        WordItem(russian: "Обмен", transcription: "abmyen", turkish: "Değişim", emoji: "🔄", category: "Alışveriş"),
        WordItem(russian: "Открыто", transcription: "atkrıta", turkish: "Açık", emoji: "🟢", category: "Alışveriş"),
        WordItem(russian: "Закрыто", transcription: "zakrıta", turkish: "Kapalı", emoji: "🔴", category: "Alışveriş"),
      ],
    ),

// --------------------------------------------------------
// 6. ULAŞIM & SEYAHAT
// --------------------------------------------------------
    LessonCategory(
      id: "seyahat",
      title: "🚗 Ulaşım & Seyahat",
      subtitle: "Yolda, istasyonda ve seyahatte",
      number: "06",
      words: [
        WordItem(russian: "Транспорт", transcription: "transpart", turkish: "Ulaşım / Taşıt", emoji: "🚌", category: "Seyahat"),
        WordItem(russian: "Остановка", transcription: "astanofka", turkish: "Durak", emoji: "🚏", category: "Seyahat"),
        WordItem(russian: "Станция", transcription: "stantsiya", turkish: "İstasyon", emoji: "🚉", category: "Seyahat"),
        WordItem(russian: "Улица", transcription: "ulitsa", turkish: "Sokak / Cadde", emoji: "🛣️", category: "Seyahat"),
        WordItem(russian: "Дорога", transcription: "daroga", turkish: "Yol", emoji: "🛤️", category: "Seyahat"),
        WordItem(russian: "Шоссе", transcription: "şosse", turkish: "Karayolu", emoji: "🛣️", category: "Seyahat"),
        WordItem(russian: "Мост", transcription: "most", turkish: "Köprü", emoji: "🌉", category: "Seyahat"),
        WordItem(russian: "Поворот", transcription: "pavarot", turkish: "Dönüş", emoji: "↩️", category: "Seyahat"),
        WordItem(russian: "Перекрёсток", transcription: "pyeryekryostok", turkish: "Kavşak", emoji: "🔀", category: "Seyahat"),
        WordItem(russian: "Светофор", transcription: "svyetafor", turkish: "Trafik ışığı", emoji: "🚦", category: "Seyahat"),
        WordItem(russian: "Водитель", transcription: "vadityel", turkish: "Sürücü", emoji: "🧑‍✈️", category: "Seyahat"),
        WordItem(russian: "Пассажир", transcription: "pasajır", turkish: "Yolcu", emoji: "💺", category: "Seyahat"),
        WordItem(russian: "Самолёт", transcription: "samalyot", turkish: "Uçak", emoji: "✈️", category: "Seyahat"),
        WordItem(russian: "Корабль", transcription: "karabl", turkish: "Gemi", emoji: "🚢", category: "Seyahat"),
        WordItem(russian: "Велосипед", transcription: "vyelasipyed", turkish: "Bisiklet", emoji: "🚲", category: "Seyahat"),
        WordItem(russian: "Мотоцикл", transcription: "matatsikl", turkish: "Motosiklet", emoji: "🏍️", category: "Seyahat"),
        WordItem(russian: "Багаж", transcription: "bagaj", turkish: "Bagaj", emoji: "🧳", category: "Seyahat"),
        WordItem(russian: "Чемодан", transcription: "çyemadan", turkish: "Bavul", emoji: "🧳", category: "Seyahat"),
        WordItem(russian: "Рюкзак", transcription: "ryukzak", turkish: "Sırt çantası", emoji: "🎒", category: "Seyahat"),
        WordItem(russian: "Паспорт", transcription: "paspart", turkish: "Pasaport", emoji: "🛂", category: "Seyahat"),
        WordItem(russian: "Виза", transcription: "viza", turkish: "Vize", emoji: "📝", category: "Seyahat"),
        WordItem(russian: "Граница", transcription: "granitsa", turkish: "Sınır", emoji: "🚧", category: "Seyahat"),
        WordItem(russian: "Таможня", transcription: "tamojnya", turkish: "Gümrük", emoji: "🛃", category: "Seyahat"),
        WordItem(russian: "Путешествие", transcription: "putyeşyestviye", turkish: "Seyahat", emoji: "🌍", category: "Seyahat"),
        WordItem(russian: "Поездка", transcription: "poyestka", turkish: "Gezi / Yolculuk", emoji: "🚗", category: "Seyahat"),
        WordItem(russian: "Отель", transcription: "atyel", turkish: "Otel", emoji: "🏨", category: "Seyahat"),
        WordItem(russian: "Гостиница", transcription: "gastinitsa", turkish: "Otel", emoji: "🛏️", category: "Seyahat"),
        WordItem(russian: "Номер", transcription: "nomyer", turkish: "Oda / Numara", emoji: "🔑", category: "Seyahat"),
        WordItem(russian: "Бронь", transcription: "bron", turkish: "Rezervasyon", emoji: "📅", category: "Seyahat"),
        WordItem(russian: "Бронировать", transcription: "braniravat", turkish: "Rezervasyon yapmak", emoji: "🛎️", category: "Seyahat"),
        WordItem(russian: "Расписание", transcription: "raspisaniye", turkish: "Tarife / Sefer saatleri", emoji: "🗓️", category: "Seyahat"),
        WordItem(russian: "Отправление", transcription: "atpravlyeniye", turkish: "Kalkış", emoji: "🛫", category: "Seyahat"),
        WordItem(russian: "Прибытие", transcription: "pribıtiye", turkish: "Varış", emoji: "🛬", category: "Seyahat"),
        WordItem(russian: "Опаздывать", transcription: "apazdıvat", turkish: "Geç kalmak", emoji: "⏰", category: "Seyahat"),
        WordItem(russian: "Опоздать", transcription: "apazdat", turkish: "Geç kalmak", emoji: "🏃‍♂️", category: "Seyahat"),
        WordItem(russian: "Быстро", transcription: "bıstra", turkish: "Hızlı / Hızlıca", emoji: "⚡", category: "Seyahat"),
        WordItem(russian: "Медленно", transcription: "myedlyenna", turkish: "Yavaş / Yavaşça", emoji: "🐌", category: "Seyahat"),
        WordItem(russian: "Здесь остановите", transcription: "zdyes astanavitye", turkish: "Burada durun", emoji: "🛑", category: "Seyahat"),
        WordItem(russian: "Сколько времени?", transcription: "skolka vryemyeni", turkish: "Ne kadar sürüyor?", emoji: "⏱️", category: "Seyahat"),
        WordItem(russian: "Как добраться?", transcription: "kak dabrattsa", turkish: "Nasıl gidilir?", emoji: "🗺️", category: "Seyahat"),
        WordItem(russian: "Где находится?", transcription: "gdye nahoditsa", turkish: "Nerede bulunuyor?", emoji: "📍", category: "Seyahat"),
        WordItem(russian: "Ближайшая станция", transcription: "blijayşaya stantsiya", turkish: "En yakın istasyon", emoji: "🚇", category: "Seyahat"),
        WordItem(russian: "Ближайшая остановка", transcription: "blijayşaya astanofka", turkish: "En yakın durak", emoji: "🚏", category: "Seyahat"),
        WordItem(russian: "Левый", transcription: "lyevıy", turkish: "Sol", emoji: "⬅️", category: "Seyahat"),
        WordItem(russian: "Правый", transcription: "pravıy", turkish: "Sağ", emoji: "➡️", category: "Seyahat"),
        WordItem(russian: "Прямой", transcription: "pryamoy", turkish: "Düz / Doğrudan", emoji: "⬆️", category: "Seyahat"),
        WordItem(russian: "Назад", transcription: "nazat", turkish: "Geri", emoji: "🔙", category: "Seyahat"),
        WordItem(russian: "Вперёд", transcription: "fpyeryot", turkish: "İleri", emoji: "🔜", category: "Seyahat"),
        WordItem(russian: "Рядом с", transcription: "ryadam s", turkish: "... yanında", emoji: "🧍🧍", category: "Seyahat"),
        WordItem(russian: "Напротив", transcription: "naprotif", turkish: "Karşısında", emoji: "↔️", category: "Seyahat"),
        WordItem(russian: "Между", transcription: "myejdu", turkish: "Arasında", emoji: "🥪", category: "Seyahat"),
        WordItem(russian: "Через", transcription: "çyeryes", turkish: "İçinden / Karşıya / Sonra", emoji: "🔀", category: "Seyahat"),
      ],
    ),

// --------------------------------------------------------
// 7. İŞ & EĞİTİM
// --------------------------------------------------------
    LessonCategory(
      id: "is",
      title: "💼 İş & Eğitim",
      subtitle: "İş, okul ve günlük çalışma hayatı",
      number: "07",
      words: [
        WordItem(russian: "Офис", transcription: "ofis", turkish: "Ofis", emoji: "🏢", category: "İş"),
        WordItem(russian: "Компания", transcription: "kampaniya", turkish: "Şirket", emoji: "🏭", category: "İş"),
        WordItem(russian: "Начальник", transcription: "naçalnik", turkish: "Patron / Yönetici", emoji: "👔", category: "İş"),
        WordItem(russian: "Коллега", transcription: "kallyega", turkish: "İş arkadaşı", emoji: "🤝", category: "İş"),
        WordItem(russian: "Сотрудник", transcription: "satrudnik", turkish: "Çalışan", emoji: "🧑‍💻", category: "İş"),
        WordItem(russian: "Клиент", transcription: "kliyent", turkish: "Müşteri", emoji: "🛒", category: "İş"),
        WordItem(russian: "Зарплата", transcription: "zarplata", turkish: "Maaş", emoji: "💰", category: "İş"),
        WordItem(russian: "Деньги", transcription: "dyengi", turkish: "Para", emoji: "💵", category: "İş"),
        WordItem(russian: "Рабочий", transcription: "raboçiy", turkish: "Çalışan / İşçi", emoji: "👷", category: "İş"),
        WordItem(russian: "Выходной", transcription: "vıhadnoy", turkish: "Tatil günü", emoji: "🛋️", category: "İş"),
        WordItem(russian: "Каникулы", transcription: "kanikulı", turkish: "Tatil", emoji: "🏖️", category: "İş"),
        WordItem(russian: "Отпуск", transcription: "otpusk", turkish: "Yıllık izin / Tatil", emoji: "🌴", category: "İş"),
        WordItem(russian: "Перерыв", transcription: "pyeryerıf", turkish: "Mola", emoji: "☕", category: "İş"),
        WordItem(russian: "Проект", transcription: "prayekt", turkish: "Proje", emoji: "📊", category: "İş"),
        WordItem(russian: "План", transcription: "plan", turkish: "Plan", emoji: "📅", category: "İş"),
        WordItem(russian: "Результат", transcription: "ryezultat", turkish: "Sonuç", emoji: "📈", category: "İş"),
        WordItem(russian: "Успех", transcription: "uspyeh", turkish: "Başarı", emoji: "🏆", category: "İş"),
        WordItem(russian: "Ошибка", transcription: "aşıpka", turkish: "Hata", emoji: "❌", category: "İş"),
        WordItem(russian: "Опыт", transcription: "opıt", turkish: "Deneyim", emoji: "🧠", category: "İş"),
        WordItem(russian: "Навык", transcription: "navık", turkish: "Beceri", emoji: "🛠️", category: "İş"),
        WordItem(russian: "Профессия", transcription: "prafyessiya", turkish: "Meslek", emoji: "🧑‍⚕️", category: "İş"),
        WordItem(russian: "Врач", transcription: "vraç", turkish: "Doktor", emoji: "🩺", category: "İş"),
        WordItem(russian: "Инженер", transcription: "injyener", turkish: "Mühendis", emoji: "📐", category: "İş"),
        WordItem(russian: "Водитель", transcription: "vadityel", turkish: "Şoför", emoji: "🚕", category: "İş"),
        WordItem(russian: "Повар", transcription: "povar", turkish: "Aşçı", emoji: "🍳", category: "İş"),
        WordItem(russian: "Официант", transcription: "afitsiant", turkish: "Garson", emoji: "🍽️", category: "İş"),
        WordItem(russian: "Продавец", transcription: "pradavyets", turkish: "Satıcı", emoji: "🏪", category: "İş"),
        WordItem(russian: "Полицейский", transcription: "palitseyskiy", turkish: "Polis memuru", emoji: "👮", category: "İş"),
        WordItem(russian: "Адвокат", transcription: "advakat", turkish: "Avukat", emoji: "⚖️", category: "İş"),
        WordItem(russian: "Ученик", transcription: "uçyenik", turkish: "Öğrenci / Öğrenen", emoji: "🎒", category: "İş"),
        WordItem(russian: "Ученица", transcription: "uçyenitsa", turkish: "Kız öğrenci", emoji: "👧", category: "İş"),
        WordItem(russian: "Класс", transcription: "klas", turkish: "Sınıf", emoji: "🏫", category: "İş"),
        WordItem(russian: "Экзамен", transcription: "yegzamyen", turkish: "Sınav", emoji: "📝", category: "İş"),
        WordItem(russian: "Вопрос", transcription: "vapros", turkish: "Soru", emoji: "❓", category: "İş"),
        WordItem(russian: "Ответ", transcription: "atvyet", turkish: "Cevap", emoji: "✅", category: "İş"),
        WordItem(russian: "Книга", transcription: "kniga", turkish: "Kitap", emoji: "📖", category: "İş"),
        WordItem(russian: "Тетрадь", transcription: "tyetrat", turkish: "Defter", emoji: "📓", category: "İş"),
        WordItem(russian: "Ручка", transcription: "ruçka", turkish: "Kalem", emoji: "🖊️", category: "İş"),
        WordItem(russian: "Карандаш", transcription: "karandaş", turkish: "Kurşun kalem", emoji: "✏️", category: "İş"),
        WordItem(russian: "Доска", transcription: "daska", turkish: "Tahta", emoji: "🖍️", category: "İş"),
        WordItem(russian: "Перемена", transcription: "pyeryemyena", turkish: "Ders arası / Teneffüs", emoji: "🔔", category: "İş"),
        WordItem(russian: "Учебник", transcription: "uçyebnik", turkish: "Ders kitabı", emoji: "📚", category: "İş"),
        WordItem(russian: "Домашнее задание", transcription: "damaşnyeye zadaniye", turkish: "Ev ödevi", emoji: "🏠", category: "İş"),
        WordItem(russian: "Обучение", transcription: "abuçyeniye", turkish: "Eğitim", emoji: "🎓", category: "İş"),
        WordItem(russian: "Знание", transcription: "znaniye", turkish: "Bilgi", emoji: "💡", category: "İş"),
        WordItem(russian: "Учёба", transcription: "uçyoba", turkish: "Eğitim / Öğrenim", emoji: "🏫", category: "İş"),
        WordItem(russian: "Практика", transcription: "praktika", turkish: "Pratik / Uygulama", emoji: "⚙️", category: "İş"),
        WordItem(russian: "Курс", transcription: "kurs", turkish: "Kurs", emoji: "🔖", category: "İş"),
        WordItem(russian: "Язык", transcription: "yazık", turkish: "Dil", emoji: "🗣️", category: "İş"),
      ],
    ),

// --------------------------------------------------------
// 8. DUYGULAR & KİŞİLİK
// --------------------------------------------------------
    LessonCategory(
      id: "duygular",
      title: "❤️ Duygular & Kişilik",
      subtitle: "Hislerini ve insanları anlat",
      number: "08",
      words: [
        WordItem(russian: "Надежда", transcription: "nadyejda", turkish: "Umut", emoji: "🕊️", category: "Duygular"),
        WordItem(russian: "Мечта", transcription: "myeçta", turkish: "Hayal", emoji: "💭", category: "Duygular"),
        WordItem(russian: "Желание", transcription: "jelaniye", turkish: "İstek / Arzu", emoji: "🌠", category: "Duygular"),
        WordItem(russian: "Интерес", transcription: "intyeryes", turkish: "İlgi", emoji: "👀", category: "Duygular"),
        WordItem(russian: "Удивление", transcription: "udivlyeniye", turkish: "Şaşkınlık", emoji: "😲", category: "Duygular"),
        WordItem(russian: "Гнев", transcription: "gnyef", turkish: "Öfke", emoji: "😡", category: "Duygular"),
        WordItem(russian: "Обида", transcription: "abida", turkish: "Kırgınlık", emoji: "🥺", category: "Duygular"),
        WordItem(russian: "Ревность", transcription: "ryevnost", turkish: "Kıskançlık", emoji: "😒", category: "Duygular"),
        WordItem(russian: "Спокойствие", transcription: "spakoystviye", turkish: "Sakinlik", emoji: "😌", category: "Duygular"),
        WordItem(russian: "Волнение", transcription: "valnyeniye", turkish: "Heyecan / Endişe", emoji: "💓", category: "Duygular"),
        WordItem(russian: "Стыд", transcription: "stıt", turkish: "Utanç", emoji: "😳", category: "Duygular"),
        WordItem(russian: "Вина", transcription: "vina", turkish: "Suçluluk", emoji: "😞", category: "Duygular"),
        WordItem(russian: "Уверенность", transcription: "uvyeryennost", turkish: "Özgüven / Eminlik", emoji: "😎", category: "Duygular"),
        WordItem(russian: "Сомнение", transcription: "samnyeniye", turkish: "Şüphe", emoji: "🤨", category: "Duygular"),
        WordItem(russian: "Удивлённый", transcription: "udivlyonnıy", turkish: "Şaşırmış", emoji: "😮", category: "Duygular"),
        WordItem(russian: "Счастливый", transcription: "şçastlivıy", turkish: "Mutlu", emoji: "😁", category: "Duygular"),
        WordItem(russian: "Грустный", transcription: "grustnıy", turkish: "Üzgün", emoji: "😢", category: "Duygular"),
        WordItem(russian: "Злой", transcription: "zloy", turkish: "Kızgın / Öfkeli", emoji: "😠", category: "Duygular"),
        WordItem(russian: "Спокойный", transcription: "spakoynıy", turkish: "Sakin", emoji: "🧘‍♂️", category: "Duygular"),
        WordItem(russian: "Добрый", transcription: "dobrıy", turkish: "İyi kalpli", emoji: "😇", category: "Duygular"),
        WordItem(russian: "Умный", transcription: "umnıy", turkish: "Zeki", emoji: "🧠", category: "Duygular"),
        WordItem(russian: "Глупый", transcription: "glupıy", turkish: "Aptal", emoji: "🤪", category: "Duygular"),
        WordItem(russian: "Весёлый", transcription: "vyesyolıy", turkish: "Neşeli", emoji: "🎉", category: "Duygular"),
        WordItem(russian: "Серьёзный", transcription: "syeryoznıy", turkish: "Ciddi", emoji: "😐", category: "Duygular"),
        WordItem(russian: "Дружелюбный", transcription: "drujelyubnıy", turkish: "Arkadaş canlısı", emoji: "🤗", category: "Duygular"),
        WordItem(russian: "Вежливый", transcription: "vyejlivıy", turkish: "Kibar", emoji: "🎩", category: "Duygular"),
        WordItem(russian: "Невежливый", transcription: "nyevyejlivıy", turkish: "Kaba", emoji: "😤", category: "Duygular"),
        WordItem(russian: "Честный", transcription: "çyestnıy", turkish: "Dürüst", emoji: "🤝", category: "Duygular"),
        WordItem(russian: "Ленивый", transcription: "lyenivıy", turkish: "Tembel", emoji: "🦥", category: "Duygular"),
        WordItem(russian: "Трудолюбивый", transcription: "trudalyubivıy", turkish: "Çalışkan", emoji: "💪", category: "Duygular"),
        WordItem(russian: "Смелый", transcription: "smyelıy", turkish: "Cesur", emoji: "🦸‍♂️", category: "Duygular"),
        WordItem(russian: "Трусливый", transcription: "truslivıy", turkish: "Korkak", emoji: "🫣", category: "Duygular"),
        WordItem(russian: "Терпеливый", transcription: "tyerpyelivıy", turkish: "Sabırlı", emoji: "🕰️", category: "Duygular"),
        WordItem(russian: "Нетерпеливый", transcription: "nyetyerpyelivıy", turkish: "Sabırsız", emoji: "🏃‍♂️", category: "Duygular"),
        WordItem(russian: "Щедрый", transcription: "şçedrıy", turkish: "Cömert", emoji: "🤲", category: "Duygular"),
        WordItem(russian: "Жадный", transcription: "jadnıy", turkish: "Cimri", emoji: "💸", category: "Duygular"),
        WordItem(russian: "Сильный", transcription: "silnıy", turkish: "Güçlü", emoji: "🏋️‍♂️", category: "Duygular"),
        WordItem(russian: "Слабый", transcription: "slabıy", turkish: "Zayıf", emoji: "🥀", category: "Duygular"),
        WordItem(russian: "Заботливый", transcription: "zabotlivıy", turkish: "İlgili / Şefkatli", emoji: "💖", category: "Duygular"),
        WordItem(russian: "Самостоятельный", transcription: "samastayatıyelnıy", turkish: "Bağımsız", emoji: "🦅", category: "Duygular"),
        WordItem(russian: "Ответственный", transcription: "atvyetstvyennıy", turkish: "Sorumlu", emoji: "📋", category: "Duygular"),
        WordItem(russian: "Аккуратный", transcription: "akkuratnıy", turkish: "Düzenli / Titiz", emoji: "✨", category: "Duygular"),
        WordItem(russian: "Грязный", transcription: "gryaznıy", turkish: "Kirli", emoji: "💩", category: "Duygular"),
        WordItem(russian: "Красивый", transcription: "krasivıy", turkish: "Güzel", emoji: "🌹", category: "Duygular"),
        WordItem(russian: "Некрасивый", transcription: "nyekrasivıy", turkish: "Çirkin", emoji: "👹", category: "Duygular"),
        WordItem(russian: "Молодой", transcription: "maladoy", turkish: "Genç", emoji: "🧒", category: "Duygular"),
        WordItem(russian: "Пожилой", transcription: "pajıloy", turkish: "Yaşlı", emoji: "🧓", category: "Duygular"),
        WordItem(russian: "Здоровый", transcription: "zdarovıy", turkish: "Sağlıklı", emoji: "🍎", category: "Duygular"),
        WordItem(russian: "Больной", transcription: "balnoy", turkish: "Hasta", emoji: "🤒", category: "Duygular"),
        WordItem(russian: "Усталый", transcription: "ustalıy", turkish: "Yorgun", emoji: "😪", category: "Duygular"),
        WordItem(russian: "Занятый", transcription: "zanyatıy", turkish: "Meşgul", emoji: "🏃‍♂️", category: "Duygular"),
        WordItem(russian: "Свободный", transcription: "svabodnıy", turkish: "Boş / Özgür", emoji: "🕊️", category: "Duygular"),
      ],
    ),

// --------------------------------------------------------
// 9. ZAMAN
// --------------------------------------------------------
    LessonCategory(
      id: "zaman",
      title: "⏰ Zaman",
      subtitle: "Saatler, günler ve zaman ifadeleri",
      number: "09",
      words: [
        WordItem(russian: "Понедельник", transcription: "panyedyelnik", turkish: "Pazartesi", emoji: "1️⃣", category: "Zaman"),
        WordItem(russian: "Вторник", transcription: "ftornik", turkish: "Salı", emoji: "2️⃣", category: "Zaman"),
        WordItem(russian: "Среда", transcription: "sryeda", turkish: "Çarşamba", emoji: "3️⃣", category: "Zaman"),
        WordItem(russian: "Четверг", transcription: "çyetvyerk", turkish: "Perşembe", emoji: "4️⃣", category: "Zaman"),
        WordItem(russian: "Пятница", transcription: "pyatnitsa", turkish: "Cuma", emoji: "5️⃣", category: "Zaman"),
        WordItem(russian: "Суббота", transcription: "subbota", turkish: "Cumartesi", emoji: "6️⃣", category: "Zaman"),
        WordItem(russian: "Воскресенье", transcription: "vaskryesyenye", turkish: "Pazar", emoji: "7️⃣", category: "Zaman"),
        WordItem(russian: "Выходные", transcription: "vıhadnıye", turkish: "Hafta sonu", emoji: "🎉", category: "Zaman"),
        WordItem(russian: "Будни", transcription: "budni", turkish: "Hafta içi", emoji: "💼", category: "Zaman"),
        WordItem(russian: "Утром", transcription: "utram", turkish: "Sabahleyin", emoji: "🌅", category: "Zaman"),
        WordItem(russian: "Днём", transcription: "dnyom", turkish: "Gündüz", emoji: "☀️", category: "Zaman"),
        WordItem(russian: "Вечером", transcription: "vyeçyeram", turkish: "Akşamleyin", emoji: "🌇", category: "Zaman"),
        WordItem(russian: "Ночью", transcription: "noçyu", turkish: "Geceleyin", emoji: "🌃", category: "Zaman"),
        WordItem(russian: "Скоро", transcription: "skora", turkish: "Yakında", emoji: "🔜", category: "Zaman"),
        WordItem(russian: "Недавно", transcription: "nyedavna", turkish: "Yakın zamanda", emoji: "🔙", category: "Zaman"),
        WordItem(russian: "Давно", transcription: "davno", turkish: "Uzun zaman önce", emoji: "⏳", category: "Zaman"),
        WordItem(russian: "Всегда", transcription: "fsyegda", turkish: "Her zaman", emoji: "♾️", category: "Zaman"),
        WordItem(russian: "Никогда", transcription: "nikagda", turkish: "Asla / Hiçbir zaman", emoji: "🚫", category: "Zaman"),
        WordItem(russian: "Иногда", transcription: "inagda", turkish: "Bazen", emoji: "🤷", category: "Zaman"),
        WordItem(russian: "Часто", transcription: "çasta", turkish: "Sık sık", emoji: "🔄", category: "Zaman"),
        WordItem(russian: "Редко", transcription: "ryetka", turkish: "Nadiren", emoji: "📉", category: "Zaman"),
        WordItem(russian: "Рано", transcription: "rana", turkish: "Erken", emoji: "🕟", category: "Zaman"),
        WordItem(russian: "Поздно", transcription: "pozna", turkish: "Geç", emoji: "🕛", category: "Zaman"),
        WordItem(russian: "Сначала", transcription: "snaçala", turkish: "Önce / İlk olarak", emoji: "1️⃣", category: "Zaman"),
        WordItem(russian: "Потом", transcription: "patom", turkish: "Sonra", emoji: "2️⃣", category: "Zaman"),
        WordItem(russian: "Скорее", transcription: "skaryeye", turkish: "Daha erken / Daha çabuk", emoji: "🏃", category: "Zaman"),
        WordItem(russian: "Сейчас", transcription: "syeyças", turkish: "Şimdi", emoji: "👇", category: "Zaman"),
        WordItem(russian: "Момент", transcription: "mamyent", turkish: "An", emoji: "📸", category: "Zaman"),
        WordItem(russian: "Минута", transcription: "minuta", turkish: "Dakika", emoji: "⏱️", category: "Zaman"),
        WordItem(russian: "Час", transcription: "ças", turkish: "Saat", emoji: "⌚", category: "Zaman"),
        WordItem(russian: "Секунда", transcription: "syekunda", turkish: "Saniye", emoji: "⏲️", category: "Zaman"),
        WordItem(russian: "Уже", transcription: "ujye", turkish: "Zaten / Artık", emoji: "✔️", category: "Zaman"),
        WordItem(russian: "Ещё", transcription: "yeşço", turkish: "Hâlâ / Daha", emoji: "➕", category: "Zaman"),
        WordItem(russian: "После", transcription: "poslye", turkish: "Sonra / Ardından", emoji: "➡️", category: "Zaman"),
        WordItem(russian: "Перед", transcription: "pyeryet", turkish: "Önce / Önünde", emoji: "⬅️", category: "Zaman"),
        WordItem(russian: "Через час", transcription: "çyeryes ças", turkish: "Bir saat sonra", emoji: "⌛", category: "Zaman"),
        WordItem(russian: "Через минуту", transcription: "çyeryes minutu", turkish: "Bir dakika sonra", emoji: "⏳", category: "Zaman"),
        WordItem(russian: "На следующей неделе", transcription: "na slyeduyuşçyey nyedyelye", turkish: "Gelecek hafta", emoji: "⏭️", category: "Zaman"),
        WordItem(russian: "На прошлой неделе", transcription: "na proşloy nyedyelye", turkish: "Geçen hafta", emoji: "⏮️", category: "Zaman"),
        WordItem(russian: "В этом году", transcription: "v etam gadu", turkish: "Bu yıl", emoji: "📅", category: "Zaman"),
        WordItem(russian: "В прошлом году", transcription: "f proşlam gadu", turkish: "Geçen yıl", emoji: "📆", category: "Zaman"),
        WordItem(russian: "В следующем году", transcription: "f slyeduyuşçyem gadu", turkish: "Gelecek yıl", emoji: "🗓️", category: "Zaman"),
        WordItem(russian: "Каждый день", transcription: "kajdıy dyen", turkish: "Her gün", emoji: "🌅", category: "Zaman"),
        WordItem(russian: "Каждую неделю", transcription: "kajduyu nyedyelyu", turkish: "Her hafta", emoji: "🔄", category: "Zaman"),
        WordItem(russian: "Каждый месяц", transcription: "kajdıy myesyats", turkish: "Her ay", emoji: "📆", category: "Zaman"),
        WordItem(russian: "Каждый год", transcription: "kajdıy got", turkish: "Her yıl", emoji: "🌍", category: "Zaman"),
        WordItem(russian: "В тот же день", transcription: "f tot jye dyen", turkish: "Aynı gün", emoji: "📌", category: "Zaman"),
        WordItem(russian: "В течение дня", transcription: "f tyeçyeniye dnya", turkish: "Gün boyunca", emoji: "☀️", category: "Zaman"),
        WordItem(russian: "В течение недели", transcription: "f tyeçyeniye nyedyeli", turkish: "Hafta boyunca", emoji: "🗓️", category: "Zaman"),
      ],
    ),

// --------------------------------------------------------
// 10. HAVA & DOĞA
// --------------------------------------------------------
    LessonCategory(
      id: "hava_doga",
      title: "🌦️ Hava & Doğa",
      subtitle: "Hava durumu, çevre ve hayvanlar",
      number: "10",
      words: [
        WordItem(russian: "Облако", transcription: "oblaka", turkish: "Bulut", emoji: "☁️", category: "Doğa"),
        WordItem(russian: "Ветер", transcription: "vyetyer", turkish: "Rüzgâr", emoji: "🌬️", category: "Doğa"),
        WordItem(russian: "Туман", transcription: "tuman", turkish: "Sis", emoji: "🌫️", category: "Doğa"),
        WordItem(russian: "Гроза", transcription: "graza", turkish: "Fırtına", emoji: "⛈️", category: "Doğa"),
        WordItem(russian: "Молния", transcription: "molniya", turkish: "Şimşek", emoji: "⚡", category: "Doğa"),
        WordItem(russian: "Гром", transcription: "grom", turkish: "Gök gürültüsü", emoji: "🌩️", category: "Doğa"),
        WordItem(russian: "Лёд", transcription: "lyot", turkish: "Buz", emoji: "🧊", category: "Doğa"),
        WordItem(russian: "Лужа", transcription: "luja", turkish: "Su birikintisi", emoji: "💦", category: "Doğa"),
        WordItem(russian: "Температура", transcription: "tyempyeratura", turkish: "Sıcaklık", emoji: "🌡️", category: "Doğa"),
        WordItem(russian: "Градус", transcription: "gradus", turkish: "Derece", emoji: "🌡️", category: "Doğa"),
        WordItem(russian: "Природа", transcription: "priroda", turkish: "Doğa", emoji: "🌿", category: "Doğa"),
        WordItem(russian: "Земля", transcription: "zyemlya", turkish: "Toprak / Dünya", emoji: "🌍", category: "Doğa"),
        WordItem(russian: "Небо", transcription: "nyeba", turkish: "Gökyüzü", emoji: "🌌", category: "Doğa"),
        WordItem(russian: "Море", transcription: "morye", turkish: "Deniz", emoji: "🌊", category: "Doğa"),
        WordItem(russian: "Озеро", transcription: "ozyera", turkish: "Göl", emoji: "🏞️", category: "Doğa"),
        WordItem(russian: "Река", transcription: "ryeka", turkish: "Nehir", emoji: "🏞️", category: "Doğa"),
        WordItem(russian: "Гора", transcription: "gara", turkish: "Dağ", emoji: "⛰️", category: "Doğa"),
        WordItem(russian: "Лес", transcription: "lyes", turkish: "Orman", emoji: "🌲", category: "Doğa"),
        WordItem(russian: "Дерево", transcription: "dyeryeva", turkish: "Ağaç", emoji: "🌳", category: "Doğa"),
        WordItem(russian: "Цветок", transcription: "tsvyetok", turkish: "Çiçek", emoji: "🌸", category: "Doğa"),
        WordItem(russian: "Трава", transcription: "trava", turkish: "Çimen / Ot", emoji: "🌱", category: "Doğa"),
        WordItem(russian: "Животное", transcription: "jivotnaye", turkish: "Hayvan", emoji: "🐾", category: "Doğa"),
        WordItem(russian: "Собака", transcription: "sabaka", turkish: "Köpek", emoji: "🐶", category: "Doğa"),
        WordItem(russian: "Кошка", transcription: "koşka", turkish: "Kedi", emoji: "🐱", category: "Doğa"),
        WordItem(russian: "Птица", transcription: "ptitsa", turkish: "Kuş", emoji: "🐦", category: "Doğa"),
        WordItem(russian: "Рыба", transcription: "rıba", turkish: "Balık", emoji: "🐟", category: "Doğa"),
        WordItem(russian: "Воздух", transcription: "vozduh", turkish: "Hava", emoji: "💨", category: "Doğa"),
        WordItem(russian: "Огонь", transcription: "agon", turkish: "Ateş", emoji: "🔥", category: "Doğa"),
        WordItem(russian: "Свет", transcription: "svyet", turkish: "Işık", emoji: "💡", category: "Doğa"),
        WordItem(russian: "Тень", transcription: "tyen", turkish: "Gölge", emoji: "👥", category: "Doğa"),
      ],
    ),

// --------------------------------------------------------
// 11. SAĞLIK & VÜCUT
// --------------------------------------------------------
    LessonCategory(
      id: "saglik",
      title: "🏥 Sağlık & Vücut",
      subtitle: "Vücudumuz, hastalıklar ve hastane",
      number: "11",
      words: [
        WordItem(russian: "Тело", transcription: "tyela", turkish: "Vücut", emoji: "🧍", category: "Sağlık"),
        WordItem(russian: "Голова", transcription: "galava", turkish: "Baş", emoji: "🗣️", category: "Sağlık"),
        WordItem(russian: "Лицо", transcription: "litso", turkish: "Yüz", emoji: "👤", category: "Sağlık"),
        WordItem(russian: "Глаз", transcription: "glas", turkish: "Göz", emoji: "👁️", category: "Sağlık"),
        WordItem(russian: "Ухо", transcription: "uha", turkish: "Kulak", emoji: "👂", category: "Sağlık"),
        WordItem(russian: "Нос", transcription: "nos", turkish: "Burun", emoji: "👃", category: "Sağlık"),
        WordItem(russian: "Рот", transcription: "rot", turkish: "Ağız", emoji: "👄", category: "Sağlık"),
        WordItem(russian: "Зуб", transcription: "zup", turkish: "Diş", emoji: "🦷", category: "Sağlık"),
        WordItem(russian: "Шея", transcription: "şeya", turkish: "Boyun", emoji: "🧣", category: "Sağlık"),
        WordItem(russian: "Рука", transcription: "ruka", turkish: "El / Kol", emoji: "💪", category: "Sağlık"),
        WordItem(russian: "Палец", transcription: "palyets", turkish: "Parmak", emoji: "☝️", category: "Sağlık"),
        WordItem(russian: "Нога", transcription: "naga", turkish: "Bacak / Ayak", emoji: "🦵", category: "Sağlık"),
        WordItem(russian: "Сердце", transcription: "syertse", turkish: "Kalp", emoji: "❤️", category: "Sağlık"),
        WordItem(russian: "Живот", transcription: "jivot", turkish: "Karın", emoji: "🤰", category: "Sağlık"),
        WordItem(russian: "Спина", transcription: "spina", turkish: "Sırt", emoji: "🧘", category: "Sağlık"),
        WordItem(russian: "Температура тела", transcription: "tyempyeratura tyela", turkish: "Vücut sıcaklığı", emoji: "🤒", category: "Sağlık"),
        WordItem(russian: "Головная боль", transcription: "galavnaya bol", turkish: "Baş ağrısı", emoji: "🤕", category: "Sağlık"),
        WordItem(russian: "Простуда", transcription: "prastuda", turkish: "Soğuk algınlığı", emoji: "🤧", category: "Sağlık"),
        WordItem(russian: "Кашель", transcription: "kaşyel", turkish: "Öksürük", emoji: "😷", category: "Sağlık"),
        WordItem(russian: "Насморк", transcription: "nasmork", turkish: "Burun akıntısı", emoji: "🤧", category: "Sağlık"),
        WordItem(russian: "Таблетка", transcription: "tablyetka", turkish: "Tablet / Hap", emoji: "💊", category: "Sağlık"),
        WordItem(russian: "Больница", transcription: "balnitsa", turkish: "Hastane", emoji: "🏥", category: "Sağlık"),
        WordItem(russian: "Пациент", transcription: "patsiyent", turkish: "Hasta", emoji: "🛌", category: "Sağlık"),
        WordItem(russian: "Здоровье", transcription: "zdarovye", turkish: "Sağlık", emoji: "⚕️", category: "Sağlık"),
        WordItem(russian: "Отдых", transcription: "otdıh", turkish: "Dinlenme", emoji: "😴", category: "Sağlık"),
      ],
    ),

// --------------------------------------------------------
// 12. TEKNOLOJİ & ŞEHİR
// --------------------------------------------------------
    LessonCategory(
      id: "teknoloji",
      title: "📱 Teknoloji & Şehir",
      subtitle: "Modern şehir hayatında sık kullanılanlar",
      number: "12",
      words: [
        WordItem(russian: "Приложение", transcription: "prilajyeniye", turkish: "Uygulama", emoji: "📱", category: "Teknoloji"),
        WordItem(russian: "Сайт", transcription: "sayt", turkish: "Web sitesi", emoji: "🌐", category: "Teknoloji"),
        WordItem(russian: "Страница", transcription: "stranitsa", turkish: "Sayfa", emoji: "📄", category: "Teknoloji"),
        WordItem(russian: "Пароль", transcription: "parol", turkish: "Şifre", emoji: "🔑", category: "Teknoloji"),
        WordItem(russian: "Аккаунт", transcription: "akkaunt", turkish: "Hesap", emoji: "👤", category: "Teknoloji"),
        WordItem(russian: "Пользователь", transcription: "polzavatyel", turkish: "Kullanıcı", emoji: "🧑‍💻", category: "Teknoloji"),
        WordItem(russian: "Настройки", transcription: "nastroyki", turkish: "Ayarlar", emoji: "⚙️", category: "Teknoloji"),
        WordItem(russian: "Кнопка", transcription: "knopka", turkish: "Buton / Düğme", emoji: "🔘", category: "Teknoloji"),
        WordItem(russian: "Экран", transcription: "ekran", turkish: "Ekran", emoji: "🖥️", category: "Teknoloji"),
        WordItem(russian: "Камера", transcription: "kamyera", turkish: "Kamera", emoji: "📷", category: "Teknoloji"),
        WordItem(russian: "Наушники", transcription: "nauşniki", turkish: "Kulaklık", emoji: "🎧", category: "Teknoloji"),
        WordItem(russian: "Зарядка", transcription: "zaryatka", turkish: "Şarj", emoji: "🔋", category: "Teknoloji"),
        WordItem(russian: "Аккумулятор", transcription: "akkumulyator", turkish: "Batarya", emoji: "🔋", category: "Teknoloji"),
        WordItem(russian: "Файл", transcription: "fayl", turkish: "Dosya", emoji: "📁", category: "Teknoloji"),
        WordItem(russian: "Папка", transcription: "papka", turkish: "Klasör", emoji: "📂", category: "Teknoloji"),
        WordItem(russian: "Скачать", transcription: "skaçat", turkish: "İndirmek", emoji: "⬇️", category: "Teknoloji"),
        WordItem(russian: "Загрузить", transcription: "zagruzit", turkish: "Yüklemek", emoji: "⬆️", category: "Teknoloji"),
        WordItem(russian: "Отправить", transcription: "atpravit", turkish: "Göndermek", emoji: "📤", category: "Teknoloji"),
        WordItem(russian: "Получить", transcription: "paluçit", turkish: "Almak / Elde etmek", emoji: "📥", category: "Teknoloji"),
        WordItem(russian: "Сохранить", transcription: "sahranit", turkish: "Kaydetmek", emoji: "💾", category: "Teknoloji"),
        WordItem(russian: "Удалить", transcription: "udalit", turkish: "Silmek", emoji: "🗑️", category: "Teknoloji"),
        WordItem(russian: "Открыть", transcription: "atkrıt", turkish: "Açmak", emoji: "🔓", category: "Teknoloji"),
        WordItem(russian: "Закрыть", transcription: "zakrıt", turkish: "Kapatmak", emoji: "🔒", category: "Teknoloji"),
        WordItem(russian: "Нажать", transcription: "najat", turkish: "Basmak", emoji: "👆", category: "Teknoloji"),
        WordItem(russian: "Работает", transcription: "rabotayet", turkish: "Çalışıyor", emoji: "✅", category: "Teknoloji"),
        WordItem(russian: "Не работает", transcription: "nye rabotayet", turkish: "Çalışmıyor", emoji: "❌", category: "Teknoloji"),
        WordItem(russian: "Ошибка", transcription: "aşıpka", turkish: "Hata", emoji: "⚠️", category: "Teknoloji"),
        WordItem(russian: "Информация", transcription: "infarmatsiya", turkish: "Bilgi", emoji: "ℹ️", category: "Teknoloji"),
        WordItem(russian: "Новости", transcription: "novasti", turkish: "Haberler", emoji: "📰", category: "Teknoloji"),
        WordItem(russian: "Инстаграм", transcription: "instagram", turkish: "Instagram", emoji: "📸", category: "Teknoloji"),
        WordItem(russian: "Видео", transcription: "vidyeo", turkish: "Video", emoji: "🎥", category: "Teknoloji"),
        WordItem(russian: "Музыка", transcription: "muzıka", turkish: "Müzik", emoji: "🎵", category: "Teknoloji"),
        WordItem(russian: "Фильм", transcription: "film", turkish: "Film", emoji: "🎬", category: "Teknoloji"),
        WordItem(russian: "Игра", transcription: "igra", turkish: "Oyun", emoji: "🎮", category: "Teknoloji"),
        WordItem(russian: "Фото", transcription: "fota", turkish: "Fotoğraf", emoji: "🖼️", category: "Teknoloji"),
        WordItem(russian: "Центр", transcription: "tsyentr", turkish: "Merkez", emoji: "🏙️", category: "Teknoloji"),
        WordItem(russian: "Район", transcription: "rayon", turkish: "Semt / İlçe", emoji: "🏘️", category: "Teknoloji"),
        WordItem(russian: "Магистраль", transcription: "magistral", turkish: "Ana yol", emoji: "🛣️", category: "Teknoloji"),
        WordItem(russian: "Здание", transcription: "zdaniye", turkish: "Bina", emoji: "🏢", category: "Teknoloji"),
        WordItem(russian: "Магазин", transcription: "magazin", turkish: "Mağaza", emoji: "🏪", category: "Teknoloji"),
        WordItem(russian: "Рынок", transcription: "rınak", turkish: "Pazar / Market", emoji: "🛒", category: "Teknoloji"),
        WordItem(russian: "Парк", transcription: "park", turkish: "Park", emoji: "🏞️", category: "Teknoloji"),
        WordItem(russian: "Площадь", transcription: "ploşçat", turkish: "Meydan", emoji: "⛲", category: "Teknoloji"),
        WordItem(russian: "Музей", transcription: "muzey", turkish: "Müze", emoji: "🏛️", category: "Teknoloji"),
        WordItem(russian: "Театр", transcription: "tyeatr", turkish: "Tiyatro", emoji: "🎭", category: "Teknoloji"),
        WordItem(russian: "Кинотеатр", transcription: "kinatyeatr", turkish: "Sinema", emoji: "🍿", category: "Teknoloji"),
        WordItem(russian: "Почта", transcription: "poçta", turkish: "Postane / Posta", emoji: "🏤", category: "Teknoloji"),
        WordItem(russian: "Мечеть", transcription: "myeçyet", turkish: "Cami", emoji: "🕌", category: "Teknoloji"),
        WordItem(russian: "Церковь", transcription: "tsyerkof", turkish: "Kilise", emoji: "⛪", category: "Teknoloji"),
        WordItem(russian: "Гостиница", transcription: "gastinitsa", turkish: "Otel", emoji: "🏨", category: "Teknoloji"),
      ],
    ),

// --------------------------------------------------------
// 13. TEMEL ZAMİRLER (PRONOUNS)
// --------------------------------------------------------
    LessonCategory(
      id: "zamirler",
      title: "👤 Temel Zamirler",
      subtitle: "Kişi, iyelik ve soru zamirleri",
      number: "13",
      words: [
        WordItem(russian: "Меня", transcription: "myenya", turkish: "Beni / Bana", emoji: "👈", category: "Zamirler"),
        WordItem(russian: "Тебя", transcription: "tyebya", turkish: "Seni / Sana", emoji: "👉", category: "Zamirler"),
        WordItem(russian: "Его", transcription: "yevo", turkish: "Onu / Onun (erkek)", emoji: "🧍‍♂️", category: "Zamirler"),
        WordItem(russian: "Её", transcription: "yeyo", turkish: "Onu / Onun (kadın)", emoji: "🧍‍♀️", category: "Zamirler"),
        WordItem(russian: "Нас", transcription: "nas", turkish: "Bizi / Bize", emoji: "🫂", category: "Zamirler"),
        WordItem(russian: "Вас", transcription: "vas", turkish: "Sizi / Size", emoji: "🫵", category: "Zamirler"),
        WordItem(russian: "Им", transcription: "im", turkish: "Onlara / Onları", emoji: "👥", category: "Zamirler"),
        WordItem(russian: "Мой", transcription: "moy", turkish: "Benim", emoji: "🙋‍♂️", category: "Zamirler"),
        WordItem(russian: "Твой", transcription: "tvoy", turkish: "Senin", emoji: "🫵", category: "Zamirler"),
        WordItem(russian: "Наш", transcription: "naş", turkish: "Bizim", emoji: "🤝", category: "Zamirler"),
        WordItem(russian: "Ваш", transcription: "vaş", turkish: "Sizin", emoji: "🙌", category: "Zamirler"),
        WordItem(russian: "Их", transcription: "ih", turkish: "Onların", emoji: "👫", category: "Zamirler"),
        WordItem(russian: "Кто", transcription: "kto", turkish: "Kim", emoji: "❓", category: "Zamirler"),
        WordItem(russian: "Что", transcription: "çto", turkish: "Ne", emoji: "🤷", category: "Zamirler"),
        WordItem(russian: "Какой", transcription: "kakoy", turkish: "Hangi / Nasıl bir", emoji: "🤔", category: "Zamirler"),
        WordItem(russian: "Который", transcription: "katorıy", turkish: "Hangi / Kaçıncı", emoji: "🔢", category: "Zamirler"),
      ],
    ),

// --------------------------------------------------------
// 14. TEMEL FİİLLER (VERBS)
// --------------------------------------------------------
    LessonCategory(
      id: "fiiller",
      title: "🏃‍♂️ Temel Fiiller",
      subtitle: "Fiillerin 2 Hali (Tamamlanmamış / Tamamlanmış)",
      number: "14",
      words: [
        WordItem(russian: "Мочь / Смочь", transcription: "moç / smoç", turkish: "Yapabilmek", emoji: "💪", category: "Fiiller"),
        WordItem(russian: "Знать / Узнать", transcription: "znat / uznat", turkish: "Bilmek / Öğrenmek", emoji: "🧠", category: "Fiiller"),
        WordItem(russian: "Думать / Подумать", transcription: "dumat / padumat", turkish: "Düşünmek", emoji: "🤔", category: "Fiiller"),
        WordItem(russian: "Помнить / Вспомнить", transcription: "pomnit / fspomnit", turkish: "Hatırlamak", emoji: "💭", category: "Fiiller"),
        WordItem(russian: "Забывать / Забыть", transcription: "zabıvat / zabıt", turkish: "Unutmak", emoji: "🤷", category: "Fiiller"),
        WordItem(russian: "Смотреть / Посмотреть", transcription: "smatryet / pasmatryet", turkish: "Bakmak / İzlemek", emoji: "👀", category: "Fiiller"),
        WordItem(russian: "Видеть / Увидеть", transcription: "vidyet / uvidyet", turkish: "Görmek", emoji: "👁️", category: "Fiiller"),
        WordItem(russian: "Слышать / Услышать", transcription: "slışat / uslışat", turkish: "Duymak", emoji: "👂", category: "Fiiller"),
        WordItem(russian: "Читать / Прочитать", transcription: "çitat / praçitat", turkish: "Okumak", emoji: "📖", category: "Fiiller"),
        WordItem(russian: "Писать / Написать", transcription: "pisat / napisat", turkish: "Yazmak", emoji: "✍️", category: "Fiiller"),
        WordItem(russian: "Идти / Пойти", transcription: "itti / payti", turkish: "Gitmek (Yürüyerek)", emoji: "🚶", category: "Fiiller"),
        WordItem(russian: "Ехать / Поехать", transcription: "yehat / payehat", turkish: "Gitmek (Araçla)", emoji: "🚗", category: "Fiiller"),
        WordItem(russian: "Приходить / Прийти", transcription: "prihadit / priyti", turkish: "Gelmek", emoji: "👋", category: "Fiiller"),
        WordItem(russian: "Уходить / Уйти", transcription: "uhadit / uyti", turkish: "Ayrılmak / Gidip çıkmak", emoji: "🚪", category: "Fiiller"),
        WordItem(russian: "Жить / Пожить", transcription: "jit / pajıt", turkish: "Yaşamak", emoji: "❤️", category: "Fiiller"),
        WordItem(russian: "Учить / Выучить", transcription: "uçit / vıuçit", turkish: "Öğretmek / Ezberlemek", emoji: "👨‍🏫", category: "Fiiller"),
        WordItem(russian: "Учиться / Научиться", transcription: "uçitsa / nauçitsa", turkish: "Öğrenmek / Okumak", emoji: "🎓", category: "Fiiller"),
        WordItem(russian: "Начинать / Начать", transcription: "naçinat / naçat", turkish: "Başlamak", emoji: "🏁", category: "Fiiller"),
        WordItem(russian: "Заканчивать / Закончить", transcription: "zakançivat / zakonçit", turkish: "Bitirmek", emoji: "🛑", category: "Fiiller"),
        WordItem(russian: "Открывать / Открыть", transcription: "atkrıvat / atkrıt", turkish: "Açmak", emoji: "🔓", category: "Fiiller"),
        WordItem(russian: "Закрывать / Закрыть", transcription: "zakrıvat / zakrıt", turkish: "Kapatmak", emoji: "🔒", category: "Fiiller"),
        WordItem(russian: "Давать / Дать", transcription: "davat / dat", turkish: "Vermek", emoji: "🤲", category: "Fiiller"),
        WordItem(russian: "Брать / Взять", transcription: "brat / vzyat", turkish: "Almak", emoji: "👐", category: "Fiiller"),
        WordItem(russian: "Делать / Сделать", transcription: "dyelat / zdyelat", turkish: "Yapmak", emoji: "🛠️", category: "Fiiller"),
        WordItem(russian: "Ждать / Подождать", transcription: "jdat / padajdat", turkish: "Beklemek", emoji: "⏳", category: "Fiiller"),
        WordItem(russian: "Искать / Поискать", transcription: "iskat / paiskat", turkish: "Aramak", emoji: "🔍", category: "Fiiller"),
        WordItem(russian: "Находить / Найти", transcription: "nahadit / nayti", turkish: "Bulmak", emoji: "🎯", category: "Fiiller"),
        WordItem(russian: "Показывать / Показать", transcription: "pakazıvat / pakazat", turkish: "Göstermek", emoji: "👉", category: "Fiiller"),
        WordItem(russian: "Спрашивать / Спросить", transcription: "spraşıvat / sprasit", turkish: "Sormak", emoji: "❓", category: "Fiiller"),
        WordItem(russian: "Отвечать / Ответить", transcription: "atvyeçat / atvyetit", turkish: "Cevap vermek", emoji: "🗣️", category: "Fiiller"),
        WordItem(russian: "Помогать / Помочь", transcription: "pamagat / pamoç", turkish: "Yardım etmek", emoji: "🤝", category: "Fiiller"),
        WordItem(russian: "Пробовать / Попробовать", transcription: "probavat / paprobavat", turkish: "Denemek", emoji: "🧪", category: "Fiiller"),
        WordItem(russian: "Использовать", transcription: "ispolzavat", turkish: "Kullanmak", emoji: "🖱️", category: "Fiiller"),
        WordItem(russian: "Понимать / Понять", transcription: "panimat / panyat", turkish: "Anlamak", emoji: "💡", category: "Fiiller"),
        WordItem(russian: "Объяснять / Объяснить", transcription: "abyasnyat / abyasnit", turkish: "Açıklamak", emoji: "💬", category: "Fiiller"),
        WordItem(russian: "Решать / Решить", transcription: "ryeşat / ryeşit", turkish: "Çözmek / Karar vermek", emoji: "✅", category: "Fiiller"),
        WordItem(russian: "Выбирать / Выбрать", transcription: "vıbirat / vıbrat", turkish: "Seçmek", emoji: "👆", category: "Fiiller"),
        WordItem(russian: "Менять / Поменять", transcription: "myenyat / pamyenyat", turkish: "Değiştirmek", emoji: "🔄", category: "Fiiller"),
        WordItem(russian: "Оставлять / Оставить", transcription: "astavlyat / astavit", turkish: "Bırakmak", emoji: "📦", category: "Fiiller"),
        WordItem(russian: "Возвращаться / Вернуться", transcription: "vazvraşçatsa / vyernutsa", turkish: "Geri dönmek", emoji: "🔙", category: "Fiiller"),
        WordItem(russian: "Звонить / Позвонить", transcription: "zvanit / pazvanit", turkish: "Aramak (Telefon)", emoji: "📞", category: "Fiiller"),
        WordItem(russian: "Встречать / Встретить", transcription: "vstryeçat / vstryetit", turkish: "Karşılamak / Buluşmak", emoji: "🫂", category: "Fiiller"),
        WordItem(russian: "Нравиться / Понравиться", transcription: "nravitsa / panravitsa", turkish: "Hoşuna gitmek", emoji: "👍", category: "Fiiller"),
        WordItem(russian: "Любить / Полюбить", transcription: "lyubit / palyubit", turkish: "Sevmek", emoji: "❤️", category: "Fiiller"),
        WordItem(russian: "Хотеть / Захотеть", transcription: "hatyet / zahatyet", turkish: "İstemek", emoji: "🥺", category: "Fiiller"),
        WordItem(russian: "Нуждаться", transcription: "nujdatsa", turkish: "İhtiyaç duymak", emoji: "🆘", category: "Fiiller"),
        WordItem(russian: "Верить / Поверить", transcription: "vyerit / pavyerit", turkish: "İnanmak", emoji: "🙏", category: "Fiiller"),
        WordItem(russian: "Надеяться / Понадеяться", transcription: "nadyeyatsa / panadyeyatsa", turkish: "Umut etmek", emoji: "🕊️", category: "Fiiller"),
        WordItem(russian: "Чувствовать / Почувствовать", transcription: "çustvavat / paçustvavat", turkish: "Hissetmek", emoji: "💖", category: "Fiiller"),
        WordItem(russian: "Бояться / Испугаться", transcription: "bayatsa / ispugatsa", turkish: "Korkmak", emoji: "😨", category: "Fiiller"),
        WordItem(russian: "Радоваться / Обрадоваться", transcription: "radavatsa / abradavatsa", turkish: "Sevinmek", emoji: "🥳", category: "Fiiller"),
        WordItem(russian: "Смеяться / Засмеяться", transcription: "smyeyatsa / zasmyeyatsa", turkish: "Gülmek", emoji: "😂", category: "Fiiller"),
        WordItem(russian: "Плакать / Заплакать", transcription: "plakat / zaplakat", turkish: "Ağlamak", emoji: "😭", category: "Fiiller"),
        WordItem(russian: "Спать / Поспать", transcription: "spat / paspat", turkish: "Uyumak", emoji: "💤", category: "Fiiller"),
        WordItem(russian: "Просыпаться / Проснуться", transcription: "prasıpatsa / prasnutsa", turkish: "Uyanmak", emoji: "🥱", category: "Fiiller"),
        WordItem(russian: "Сидеть / Посидеть", transcription: "sidyet / pasidyet", turkish: "Oturmak", emoji: "🪑", category: "Fiiller"),
        WordItem(russian: "Стоять / Постоять", transcription: "stoyat / pastoyat", turkish: "Ayakta durmak", emoji: "🧍", category: "Fiiller"),
        WordItem(russian: "Бежать / Побежать", transcription: "byejat / pabyejat", turkish: "Koşmak", emoji: "🏃", category: "Fiiller"),
        WordItem(russian: "Есть / Съесть", transcription: "yest / syest", turkish: "Yemek yemek", emoji: "🍽️", category: "Fiiller"),
        WordItem(russian: "Пить / Выпить", transcription: "pit / vıpit", turkish: "İçmek", emoji: "🥤", category: "Fiiller"),
        WordItem(russian: "Готовить / Приготовить", transcription: "gatovit / prigatovit", turkish: "Hazırlamak / Pişirmek", emoji: "🍳", category: "Fiiller"),
        WordItem(russian: "Покупать / Купить", transcription: "pakupat / kupit", turkish: "Satın almak", emoji: "🛒", category: "Fiiller"),
        WordItem(russian: "Платить / Заплатить", transcription: "platit / zaplatit", turkish: "Ödemek", emoji: "💳", category: "Fiiller"),
        WordItem(russian: "Стоить", transcription: "stoit", turkish: "Fiyatı olmak / Değmek", emoji: "🏷️", category: "Fiiller"),
      ],
    ),
// --------------------------------------------------------
// 15. SIK KULLANILAN DİĞER KELİMELER
// --------------------------------------------------------
    LessonCategory(
      id: "1000_kalan",
      title: "🔥 Sık Kullanılan Kelimeler",
      subtitle: "Zarflar, bağlaçlar ve genel ifadeler",
      number: "15",
      words: [
        WordItem(russian: "Где", transcription: "gdye", turkish: "Nerede", emoji: "📍", category: "Sık Kullanılan"),
        WordItem(russian: "Когда", transcription: "kagda", turkish: "Ne zaman", emoji: "⏰", category: "Sık Kullanılan"),
        WordItem(russian: "Почему", transcription: "paçyemu", turkish: "Neden", emoji: "🤷", category: "Sık Kullanılan"),
        WordItem(russian: "Как", transcription: "kak", turkish: "Nasıl", emoji: "🛠️", category: "Sık Kullanılan"),
        WordItem(russian: "Сколько", transcription: "skolka", turkish: "Ne kadar / Kaç", emoji: "🔢", category: "Sık Kullanılan"),
        WordItem(russian: "Куда", transcription: "kuda", turkish: "Nereye", emoji: "➡️", category: "Sık Kullanılan"),
        WordItem(russian: "Откуда", transcription: "atkuda", turkish: "Nereden", emoji: "🔙", category: "Sık Kullanılan"),
        WordItem(russian: "Зачем", transcription: "zaçyem", turkish: "Ne için / Neden", emoji: "🤔", category: "Sık Kullanılan"),
        WordItem(russian: "Потому что", transcription: "patamu şto", turkish: "Çünkü", emoji: "💡", category: "Sık Kullanılan"),
        WordItem(russian: "Поэтому", transcription: "paetamu", turkish: "Bu yüzden", emoji: "🎯", category: "Sık Kullanılan"),
        WordItem(russian: "Тогда", transcription: "tagda", turkish: "O zaman", emoji: "⏳", category: "Sık Kullanılan"),
        WordItem(russian: "Теперь", transcription: "tyepyer", turkish: "Şimdi / Artık", emoji: "👇", category: "Sık Kullanılan"),
        WordItem(russian: "Здесь", transcription: "zdyes", turkish: "Burada", emoji: "📌", category: "Sık Kullanılan"),
        WordItem(russian: "Там", transcription: "tam", turkish: "Orada", emoji: "👉", category: "Sık Kullanılan"),
        WordItem(russian: "Везде", transcription: "vyezdye", turkish: "Her yerde", emoji: "🌍", category: "Sık Kullanılan"),
        WordItem(russian: "Нигде", transcription: "nigdye", turkish: "Hiçbir yerde", emoji: "🚫", category: "Sık Kullanılan"),
        WordItem(russian: "Всегда", transcription: "fsyegda", turkish: "Her zaman", emoji: "♾️", category: "Sık Kullanılan"),
        WordItem(russian: "Иногда", transcription: "inagda", turkish: "Bazen", emoji: "🤷", category: "Sık Kullanılan"),
        WordItem(russian: "Часто", transcription: "çasta", turkish: "Sık sık", emoji: "🔄", category: "Sık Kullanılan"),
        WordItem(russian: "Редко", transcription: "ryetka", turkish: "Nadiren", emoji: "📉", category: "Sık Kullanılan"),
        WordItem(russian: "Никогда", transcription: "nikagda", turkish: "Asla", emoji: "❌", category: "Sık Kullanılan"),
        WordItem(russian: "Много", transcription: "mnoga", turkish: "Çok", emoji: "➕", category: "Sık Kullanılan"),
        WordItem(russian: "Мало", transcription: "mala", turkish: "Az", emoji: "➖", category: "Sık Kullanılan"),
        WordItem(russian: "Больше", transcription: "bolşye", turkish: "Daha fazla", emoji: "📈", category: "Sık Kullanılan"),
        WordItem(russian: "Меньше", transcription: "myenşye", turkish: "Daha az", emoji: "📉", category: "Sık Kullanılan"),
        WordItem(russian: "Очень", transcription: "oçyen", turkish: "Çok", emoji: "❗", category: "Sık Kullanılan"),
        WordItem(russian: "Почти", transcription: "paçti", turkish: "Neredeyse", emoji: "🤏", category: "Sık Kullanılan"),
        WordItem(russian: "Совсем", transcription: "safsyem", turkish: "Tamamen / Hiç", emoji: "💯", category: "Sık Kullanılan"),
        WordItem(russian: "Только", transcription: "tolka", turkish: "Sadece", emoji: "1️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Даже", transcription: "dajye", turkish: "Hatta", emoji: "😲", category: "Sık Kullanılan"),
        WordItem(russian: "Также", transcription: "takjye", turkish: "Ayrıca / Aynı şekilde", emoji: "➕", category: "Sık Kullanılan"),
        WordItem(russian: "Опять", transcription: "apyat", turkish: "Yine", emoji: "🔁", category: "Sık Kullanılan"),
        WordItem(russian: "Вместе", transcription: "vmyestye", turkish: "Birlikte", emoji: "🫂", category: "Sık Kullanılan"),
        WordItem(russian: "Вместо", transcription: "vmyesta", turkish: "Yerine", emoji: "🔀", category: "Sık Kullanılan"),
        WordItem(russian: "Без", transcription: "byez", turkish: "-siz / Olmadan", emoji: "🚫", category: "Sık Kullanılan"),
        WordItem(russian: "Для", transcription: "dlya", turkish: "İçin", emoji: "🎁", category: "Sık Kullanılan"),
        WordItem(russian: "С", transcription: "s", turkish: "İle / -den", emoji: "🤝", category: "Sık Kullanılan"),
        WordItem(russian: "У", transcription: "u", turkish: "Yanında / Sahipliğinde", emoji: "🧍", category: "Sık Kullanılan"),
        WordItem(russian: "В", transcription: "v", turkish: "İçinde / -e", emoji: "📥", category: "Sık Kullanılan"),
        WordItem(russian: "На", transcription: "na", turkish: "Üzerinde / -de", emoji: "📤", category: "Sık Kullanılan"),
        WordItem(russian: "Из", transcription: "iz", turkish: "İçinden / -den", emoji: "🚪", category: "Sık Kullanılan"),
        WordItem(russian: "До", transcription: "do", turkish: "Kadar / Öncesine kadar", emoji: "🏁", category: "Sık Kullanılan"),
        WordItem(russian: "После", transcription: "poslye", turkish: "Sonra", emoji: "⏭️", category: "Sık Kullanılan"),
        WordItem(russian: "Перед", transcription: "pyeryet", turkish: "Önce / Önünde", emoji: "⏮️", category: "Sık Kullanılan"),
        WordItem(russian: "Между", transcription: "myejdu", turkish: "Arasında", emoji: "↔️", category: "Sık Kullanılan"),
        WordItem(russian: "Около", transcription: "okala", turkish: "Yaklaşık / Yanında", emoji: "📍", category: "Sık Kullanılan"),
        WordItem(russian: "Против", transcription: "protif", turkish: "Karşı", emoji: "🥊", category: "Sık Kullanılan"),
        WordItem(russian: "За", transcription: "za", turkish: "Arkasında / İçin", emoji: "🔙", category: "Sık Kullanılan"),
        WordItem(russian: "И", transcription: "i", turkish: "Ve", emoji: "➕", category: "Sık Kullanılan"),
        WordItem(russian: "Но", transcription: "no", turkish: "Ama", emoji: "✋", category: "Sık Kullanılan"),
        WordItem(russian: "Или", transcription: "ili", turkish: "Veya", emoji: "🔀", category: "Sık Kullanılan"),
        WordItem(russian: "Если", transcription: "yesli", turkish: "Eğer", emoji: "❓", category: "Sık Kullanılan"),
        WordItem(russian: "Хотя", transcription: "hatya", turkish: "Her ne kadar / Rağmen", emoji: "🤷‍♂️", category: "Sık Kullanılan"),
        WordItem(russian: "Чтобы", transcription: "ştobı", turkish: "İçin / -mesi için", emoji: "🎯", category: "Sık Kullanılan"),
        WordItem(russian: "Потому", transcription: "patamu", turkish: "Bu nedenle", emoji: "📌", category: "Sık Kullanılan"),
        WordItem(russian: "Можно", transcription: "mojna", turkish: "Mümkün / Olabilir", emoji: "👍", category: "Sık Kullanılan"),
        WordItem(russian: "Нельзя", transcription: "nyelzya", turkish: "Yasak / Olmaz", emoji: "🚫", category: "Sık Kullanılan"),
        WordItem(russian: "Нужно", transcription: "nujna", turkish: "Gerekli", emoji: "✅", category: "Sık Kullanılan"),
        WordItem(russian: "Надо", transcription: "nada", turkish: "Gerek / Lazım", emoji: "❗", category: "Sık Kullanılan"),
        WordItem(russian: "Необходимо", transcription: "nyeeabhodima", turkish: "Gerekli", emoji: "⚠️", category: "Sık Kullanılan"),
        WordItem(russian: "Должен", transcription: "doljyen", turkish: "Zorunda / -meli", emoji: "👉", category: "Sık Kullanılan"),
        WordItem(russian: "Дорого", transcription: "doraga", turkish: "Pahalı", emoji: "💸", category: "Sık Kullanılan"),
        WordItem(russian: "Дёшево", transcription: "dyoşyeva", turkish: "Ucuz", emoji: "🪙", category: "Sık Kullanılan"),
        WordItem(russian: "Хороший", transcription: "haroşiy", turkish: "İyi", emoji: "😊", category: "Sık Kullanılan"),
        WordItem(russian: "Плохой", transcription: "plahoy", turkish: "Kötü", emoji: "☹️", category: "Sık Kullanılan"),
        WordItem(russian: "Большой", transcription: "balşoy", turkish: "Büyük", emoji: "🐘", category: "Sık Kullanılan"),
        WordItem(russian: "Маленький", transcription: "malyenkiy", turkish: "Küçük", emoji: "🐜", category: "Sık Kullanılan"),
        WordItem(russian: "Новый", transcription: "novıy", turkish: "Yeni", emoji: "🆕", category: "Sık Kullanılan"),
        WordItem(russian: "Старый", transcription: "starıy", turkish: "Eski / Yaşlı", emoji: "🕰️", category: "Sık Kullanılan"),
        WordItem(russian: "Первый", transcription: "pyervıy", turkish: "İlk / Birinci", emoji: "1️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Последний", transcription: "paslyedniy", turkish: "Son / Sonuncu", emoji: "🏁", category: "Sık Kullanılan"),
        WordItem(russian: "Правильный", transcription: "pravilnıy", turkish: "Doğru", emoji: "✅", category: "Sık Kullanılan"),
        WordItem(russian: "Неправильный", transcription: "nyepravilnıy", turkish: "Yanlış", emoji: "❌", category: "Sık Kullanılan"),
        WordItem(russian: "Важный", transcription: "vajnıy", turkish: "Önemli", emoji: "⭐", category: "Sık Kullanılan"),
        WordItem(russian: "Простой", transcription: "prastoy", turkish: "Basit / Kolay", emoji: "🧩", category: "Sık Kullanılan"),
        WordItem(russian: "Сложный", transcription: "slojnıy", turkish: "Zor / Karmaşık", emoji: "🤯", category: "Sık Kullanılan"),
        WordItem(russian: "Легко", transcription: "lyohka", turkish: "Kolayca", emoji: "🎈", category: "Sık Kullanılan"),
        WordItem(russian: "Трудно", transcription: "trudna", turkish: "Zor", emoji: "🧗", category: "Sık Kullanılan"),
        WordItem(russian: "Быстро", transcription: "bıstra", turkish: "Hızlı", emoji: "⚡", category: "Sık Kullanılan"),
        WordItem(russian: "Медленно", transcription: "myedlyenna", turkish: "Yavaş", emoji: "🐢", category: "Sık Kullanılan"),
        WordItem(russian: "Правильно", transcription: "pravilna", turkish: "Doğru şekilde", emoji: "🎯", category: "Sık Kullanılan"),
        WordItem(russian: "Один", transcription: "adin", turkish: "Bir", emoji: "1️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Два", transcription: "dva", turkish: "İki", emoji: "2️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Три", transcription: "tri", turkish: "Üç", emoji: "3️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Четыре", transcription: "çyetırye", turkish: "Dört", emoji: "4️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Пять", transcription: "pyat", turkish: "Beş", emoji: "5️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Шесть", transcription: "şest", turkish: "Altı", emoji: "6️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Семь", transcription: "syem", turkish: "Yedi", emoji: "7️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Восемь", transcription: "vosyem", turkish: "Sekiz", emoji: "8️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Девять", transcription: "dyevyat", turkish: "Dokuz", emoji: "9️⃣", category: "Sık Kullanılan"),
        WordItem(russian: "Десять", transcription: "dyesyat", turkish: "On", emoji: "🔟", category: "Sık Kullanılan"),
        WordItem(russian: "Сто", transcription: "sto", turkish: "Yüz", emoji: "💯", category: "Sık Kullanılan"),
        WordItem(russian: "Тысяча", transcription: "tısyaça", turkish: "Bin", emoji: "♾️", category: "Sık Kullanılan"),
        WordItem(russian: "Сегодня", transcription: "syevodnya", turkish: "Bugün", emoji: "📍", category: "Sık Kullanılan"),
        WordItem(russian: "Вчера", transcription: "fçyera", turkish: "Dün", emoji: "🔙", category: "Sık Kullanılan"),
        WordItem(russian: "Завтра", transcription: "zaftra", turkish: "Yarın", emoji: "🔜", category: "Sık Kullanılan"),
        WordItem(russian: "Утро", transcription: "utra", turkish: "Sabah", emoji: "🌅", category: "Sık Kullanılan"),
        WordItem(russian: "Вечер", transcription: "vyeçyer", turkish: "Akşam", emoji: "🌇", category: "Sık Kullanılan"),
        WordItem(russian: "Ночь", transcription: "noç", turkish: "Gece", emoji: "🌃", category: "Sık Kullanılan"),
        WordItem(russian: "День", transcription: "dyen", turkish: "Gün", emoji: "☀️", category: "Sık Kullanılan"),
        WordItem(russian: "Неделя", transcription: "nyedyelya", turkish: "Hafta", emoji: "📅", category: "Sık Kullanılan"),
        WordItem(russian: "Месяц", transcription: "myesyats", turkish: "Ay", emoji: "📆", category: "Sık Kullanılan"),
        WordItem(russian: "Год", transcription: "got", turkish: "Yıl", emoji: "🌍", category: "Sık Kullanılan"),
        WordItem(russian: "Минута", transcription: "minuta", turkish: "Dakika", emoji: "⏱️", category: "Sık Kullanılan"),
        WordItem(russian: "Час", transcription: "ças", turkish: "Saat", emoji: "⌚", category: "Sık Kullanılan"),
        WordItem(russian: "Место", transcription: "myesta", turkish: "Yer", emoji: "📍", category: "Sık Kullanılan"),
        WordItem(russian: "Время", transcription: "vryemya", turkish: "Zaman", emoji: "⏳", category: "Sık Kullanılan"),
        WordItem(russian: "Жизнь", transcription: "jizn", turkish: "Hayat", emoji: "🌱", category: "Sık Kullanılan"),
        WordItem(russian: "Мир", transcription: "mir", turkish: "Dünya / Barış", emoji: "🌎", category: "Sık Kullanılan"),
        WordItem(russian: "Дом", transcription: "dom", turkish: "Ev", emoji: "🏠", category: "Sık Kullanılan"),
        WordItem(russian: "Город", transcription: "gorat", turkish: "Şehir", emoji: "🏙️", category: "Sık Kullanılan"),
        WordItem(russian: "Страна", transcription: "strana", turkish: "Ülke", emoji: "🗺️", category: "Sık Kullanılan"),
        WordItem(russian: "Человек", transcription: "çelavyek", turkish: "İnsan", emoji: "🧍", category: "Sık Kullanılan"),
        WordItem(russian: "Люди", transcription: "lyudi", turkish: "İnsanlar", emoji: "👥", category: "Sık Kullanılan"),
        WordItem(russian: "Друг", transcription: "druk", turkish: "Arkadaş / Dost", emoji: "🫂", category: "Sık Kullanılan"),
        WordItem(russian: "Семья", transcription: "syemya", turkish: "Aile", emoji: "👨‍👩‍👧", category: "Sık Kullanılan"),
        WordItem(russian: "Имя", transcription: "imya", turkish: "İsim", emoji: "🪪", category: "Sık Kullanılan"),
        WordItem(russian: "Слово", transcription: "slova", turkish: "Kelime", emoji: "💬", category: "Sık Kullanılan"),
        WordItem(russian: "Вопрос", transcription: "vapros", turkish: "Soru", emoji: "❓", category: "Sık Kullanılan"),
        WordItem(russian: "Ответ", transcription: "atvyet", turkish: "Cevap", emoji: "✅", category: "Sık Kullanılan"),
        WordItem(russian: "Язык", transcription: "yazık", turkish: "Dil", emoji: "🗣️", category: "Sık Kullanılan"),
        WordItem(russian: "Русский", transcription: "ruskiy", turkish: "Rusça / Rus", emoji: "🇷🇺", category: "Sık Kullanılan"),
        WordItem(russian: "Турецкий", transcription: "turyetskiy", turkish: "Türkçe / Türk", emoji: "🇹🇷", category: "Sık Kullanılan"),
        WordItem(russian: "Спасибо", transcription: "spasiba", turkish: "Teşekkürler", emoji: "🙏", category: "Sık Kullanılan"),
        WordItem(russian: "Пожалуйста", transcription: "pajalusta", turkish: "Lütfen / Rica ederim", emoji: "😇", category: "Sık Kullanılan"),
        WordItem(russian: "Извините", transcription: "izvinitye", turkish: "Affedersiniz", emoji: "🙇", category: "Sık Kullanılan"),
        WordItem(russian: "Конечно", transcription: "kanyeşna", turkish: "Elbette", emoji: "👌", category: "Sık Kullanılan"),
        WordItem(russian: "Наверное", transcription: "navyernaye", turkish: "Muhtemelen", emoji: "🤔", category: "Sık Kullanılan"),
        WordItem(russian: "Возможно", transcription: "vazmojna", turkish: "Belki / Mümkün", emoji: "🤷", category: "Sık Kullanılan"),
        WordItem(russian: "Правда", transcription: "pravda", turkish: "Gerçek / Doğru", emoji: "💯", category: "Sık Kullanılan"),
        WordItem(russian: "Конец", transcription: "kanyets", turkish: "Son", emoji: "🔚", category: "Sık Kullanılan"),
        WordItem(russian: "Начало", transcription: "naçala", turkish: "Başlangıç", emoji: "🏁", category: "Sık Kullanılan"),
        WordItem(russian: "Причина", transcription: "priçina", turkish: "Sebep", emoji: "🔍", category: "Sık Kullanılan"),
        WordItem(russian: "Проблема", transcription: "prablyema", turkish: "Sorun", emoji: "⚠️", category: "Sık Kullanılan"),
        WordItem(russian: "Решение", transcription: "ryeşyeniye", turkish: "Çözüm / Karar", emoji: "💡", category: "Sık Kullanılan"),
        WordItem(russian: "Пример", transcription: "primyer", turkish: "Örnek", emoji: "📝", category: "Sık Kullanılan"),
        WordItem(russian: "Способ", transcription: "sposap", turkish: "Yöntem / Yol", emoji: "🛠️", category: "Sık Kullanılan"),
        WordItem(russian: "Вещь", transcription: "vyeşç", turkish: "Şey / Eşya", emoji: "📦", category: "Sık Kullanılan"),
        WordItem(russian: "Часть", transcription: "çast", turkish: "Parça / Bölüm", emoji: "🧩", category: "Sık Kullanılan"),
        WordItem(russian: "Рядом", transcription: "ryadam", turkish: "Yanında / Yakında", emoji: "🧍🧍", category: "Sık Kullanılan"),
        WordItem(russian: "Далеко", transcription: "dalyeko", turkish: "Uzak", emoji: "🔭", category: "Sık Kullanılan"),
        WordItem(russian: "Близко", transcription: "bliska", turkish: "Yakın", emoji: "🔍", category: "Sık Kullanılan"),
        WordItem(russian: "Прямо", transcription: "pryama", turkish: "Düz", emoji: "⬆️", category: "Sık Kullanılan"),
        WordItem(russian: "Назад", transcription: "nazat", turkish: "Geri", emoji: "🔙", category: "Sık Kullanılan"),
        WordItem(russian: "Вперёд", transcription: "fpyeryot", turkish: "İleri", emoji: "🔜", category: "Sık Kullanılan"),
        WordItem(russian: "Налево", transcription: "nalyeva", turkish: "Sola", emoji: "⬅️", category: "Sık Kullanılan"),
        WordItem(russian: "Направо", transcription: "naprava", turkish: "Sağa", emoji: "➡️", category: "Sık Kullanılan"),
        WordItem(russian: "Помощь", transcription: "pomaşç", turkish: "Yardım", emoji: "🆘", category: "Sık Kullanılan"),
        WordItem(russian: "Встреча", transcription: "fstryeça", turkish: "Buluşma / Toplantı", emoji: "🤝", category: "Sık Kullanılan"),
        WordItem(russian: "Работа", transcription: "rabota", turkish: "İş", emoji: "💼", category: "Sık Kullanılan"),
        WordItem(russian: "Деньги", transcription: "dyengi", turkish: "Para", emoji: "💵", category: "Sık Kullanılan"),
        WordItem(russian: "Машина", transcription: "maşına", turkish: "Araba", emoji: "🚘", category: "Sık Kullanılan"),
        WordItem(russian: "Автобус", transcription: "aftobus", turkish: "Otobüs", emoji: "🚌", category: "Sık Kullanılan"),
        WordItem(russian: "Поезд", transcription: "poyest", turkish: "Tren", emoji: "🚆", category: "Sık Kullanılan"),
        WordItem(russian: "Аэропорт", transcription: "aeraport", turkish: "Havalimanı", emoji: "🛫", category: "Sık Kullanılan"),
        WordItem(russian: "Билет", transcription: "bilyet", turkish: "Bilet", emoji: "🎫", category: "Sık Kullanılan"),
        WordItem(russian: "Отель", transcription: "atyel", turkish: "Otel", emoji: "🏨", category: "Sık Kullanılan"),
        WordItem(russian: "Ресторан", transcription: "ryestaran", turkish: "Restoran", emoji: "🍽️", category: "Sık Kullanılan"),
        WordItem(russian: "Магазин", transcription: "magazin", turkish: "Mağaza", emoji: "🏪", category: "Sık Kullanılan"),
        WordItem(russian: "Телефон", transcription: "tyelyefon", turkish: "Telefon", emoji: "📱", category: "Sık Kullanılan"),
        WordItem(russian: "Компьютер", transcription: "kampyutyer", turkish: "Bilgisayar", emoji: "💻", category: "Sık Kullanılan"),
        WordItem(russian: "Интернет", transcription: "intyernyet", turkish: "İnternet", emoji: "🌐", category: "Sık Kullanılan"),
      ],
    ),
  ];

  static List<WordItem> get dictionary {
    final List<WordItem> allWords = [];
    for (final lesson in lessons) {
      allWords.addAll(lesson.words);
    }
    return allWords;
  }

  static final List<DialogTopic> dialogs = [
    DialogTopic(
      title: "Tanışma ve Selamlaşma",
      subtitle: "İlk tanışmada kullanabileceğin ifadeler",
      icon: "👋",
      lines: [
        DialogLine(speaker: "Sen", russian: "— Здравствуйте!", transcription: "— Zdrastvuytye!", turkish: "— Merhaba!"),
        DialogLine(speaker: "Aleksei", russian: "— Здравствуйте! Как вас зовут?", transcription: "— Zdrastvuytye! Kak vas zavut?", turkish: "— Merhaba! Adınız ne?"),
        DialogLine(speaker: "Sen", russian: "— Меня зовут Шериф. А вас?", transcription: "— Myenya zavut Giray. A vas?", turkish: "— Benim adım Giray. Ya sizin?"),
        DialogLine(speaker: "Aleksei", russian: "— Меня зовут Алексей.", transcription: "— Myenya zavut Alyeksyey.", turkish: "— Benim adım Aleksei."),
        DialogLine(speaker: "Aleksei", russian: "— Очень приятно!", transcription: "— Oçyen priyatna!", turkish: "— Memnun oldum!"),
        DialogLine(speaker: "Sen", russian: "— Мне тоже приятно!", transcription: "— Mnye toje priyatna!", turkish: "— Ben de memnun oldum!"),
      ],
    ),
    DialogTopic(
      title: "Restoranda Sipariş",
      subtitle: "Kafede veya restoranda sipariş ver",
      icon: "🍽️",
      lines: [
        DialogLine(speaker: "Garson", russian: "— Здравствуйте! Что будете заказывать?", transcription: "— Zdrastvuytye! Şto budyetye zakazıvat?", turkish: "— Merhaba! Ne sipariş edeceksiniz?"),
        DialogLine(speaker: "Sen", russian: "— Здравствуйте. Я буду кофе и суп.", transcription: "— Zdrastvuytye. Ya budu kofye i sup.", turkish: "— Merhaba. Kahve ve çorba alacağım."),
        DialogLine(speaker: "Garson", russian: "— Что-нибудь ещё?", transcription: "— Şto-nibut yeşço?", turkish: "— Başka bir şey?"),
        DialogLine(speaker: "Sen", russian: "— Нет, спасибо.", transcription: "— Nyet, spasiba.", turkish: "— Hayır, teşekkürler."),
        DialogLine(speaker: "Sen", russian: "— Счёт, пожалуйста.", transcription: "— Şçot, pajalusta.", turkish: "— Hesap lütfen."),
      ],
    ),
  ];
}

// ============================================================
// İLERLEME YÖNETİCİSİ
// ============================================================

class ProgressManager extends ChangeNotifier {
  static final ProgressManager instance = ProgressManager._internal();
  ProgressManager._internal();

  int learnedWordsCount = 428;
  int userXP = 2450;
  int streakDays = 37;

  void incrementLearnedWord() {
    learnedWordsCount++;
    userXP += 15;
    notifyListeners();
  }
}

// ============================================================
// RENKLER
// ============================================================

class AppColors {
  static const bgTop = Color(0xFF0B132B);
  static const bgMid = Color(0xFF1C2541);
  static const bgBottom = Color(0xFF0B1120);

  static const primaryBlue = Color(0xFF3B82F6);
  static const accentGreen = Color(0xFF10B981);
  static const accentRed = Color(0xFFEF4444);
  static const accentPurple = Color(0xFF8B5CF6);
  static const accentOrange = Color(0xFFF59E0B);

  static const textLight = Color(0xFFF8FAFC);
  static const textGrey = Color(0x99F8FAFC);
}

// ============================================================
// APP
// ============================================================

class RuscaCepteApp extends StatelessWidget {
  const RuscaCepteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rusça Cepte",
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Roboto",
        scaffoldBackgroundColor: AppColors.bgBottom,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryBlue,
          brightness: Brightness.dark,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// ============================================================
// GLASS CARD
// ============================================================

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double radius;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.radius = 22,
  });

  @override
  Widget build(BuildContext context) {
    final card = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: Colors.white.withOpacity(0.20),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );

    if (onTap == null) {
      return card;
    }

    return GestureDetector(
      onTap: onTap,
      child: card,
    );
  }
}

// ============================================================
// ARKA PLAN
// ============================================================

class AppBackground extends StatelessWidget {
  final String imageUrl;
  final Widget child;

  const AppBackground({
    super.key,
    required this.imageUrl,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.bgTop,
                      AppColors.bgMid,
                      AppColors.bgBottom,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.35),
                  Colors.black.withOpacity(0.55),
                  Colors.black.withOpacity(0.80),
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

// ============================================================
// MAIN SCREEN
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    LearnScreen(),
    DialogsScreen(),
    DictionaryScreen(),
    ProfileScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          height: 76,
          decoration: BoxDecoration(
            color: const Color(0xE60B132B),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: Colors.white.withOpacity(0.10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.30),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(icon: Icons.home_rounded, label: "Ana Sayfa", selected: currentIndex == 0, onTap: () => changeTab(0)),
              _NavItem(icon: Icons.menu_book_rounded, label: "Öğren", selected: currentIndex == 1, onTap: () => changeTab(1)),
              GestureDetector(
                onTap: () => changeTab(2),
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryBlue,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withOpacity(0.45),
                        blurRadius: 18,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.forum_rounded, color: Colors.white, size: 28),
                ),
              ),
              _NavItem(icon: Icons.translate_rounded, label: "Sözlük", selected: currentIndex == 3, onTap: () => changeTab(3)),
              _NavItem(icon: Icons.person_rounded, label: "Profil", selected: currentIndex == 4, onTap: () => changeTab(4)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({required this.icon, required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 23,
              color: selected ? AppColors.primaryBlue : Colors.white.withOpacity(0.55),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 9,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected ? Colors.white : Colors.white.withOpacity(0.55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ANA SAYFA
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return AppBackground(
      imageUrl: "assets/images/home_bg.jpg",
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<User?>(
                stream: authService.authStateChanges,
                builder: (context, snapshot) {
                  final user = snapshot.data;

                  if (user == null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "🇷🇺 Rusça Cepte",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Merhaba! Öğrenmeye başla 👋",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textGrey),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            await authService.signInWithGoogle();
                          },
                          icon: const Icon(Icons.g_mobiledata_rounded, size: 28),
                          label: const Text("Google ile devam et", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black87,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ],
                    );
                  }

                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primaryBlue.withOpacity(0.2),
                        backgroundImage: user.photoURL != null ? NetworkImage(user.photoURL!) : null,
                        child: user.photoURL == null ? const Icon(Icons.person, color: AppColors.primaryBlue) : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.displayName ?? "Kullanıcı", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white)),
                            const SizedBox(height: 2),
                            const Text("A1 Başlangıç Seviyesi", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primaryBlue)),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await authService.signOut();
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), shape: BoxShape.circle),
                          child: const Icon(Icons.logout_rounded, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 35),
              const Text(
                "Gerçek hayatta\nRusça konuşmayı öğren!",
                style: TextStyle(fontSize: 31, height: 1.10, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.7),
              ),
              const SizedBox(height: 12),
              Text("Kelimeleri ezberlemek yerine kullanmayı öğren.", style: TextStyle(fontSize: 14, height: 1.5, color: Colors.white.withOpacity(0.68))),
              const SizedBox(height: 28),
              GlassCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(color: AppColors.primaryBlue.withOpacity(0.18), borderRadius: BorderRadius.circular(15)),
                          child: const Icon(Icons.timer_outlined, color: AppColors.primaryBlue, size: 24),
                        ),
                        const SizedBox(width: 13),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Günün Hedefi", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                              SizedBox(height: 4),
                              Text("15 dakika öğrenme", style: TextStyle(fontSize: 12, color: AppColors.textGrey)),
                            ],
                          ),
                        ),
                        const Text("+120 XP", style: TextStyle(color: AppColors.accentGreen, fontSize: 13, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: 0.70,
                        minHeight: 8,
                        backgroundColor: Colors.white.withOpacity(0.08),
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bugünkü ilerleme", style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.50))),
                        const Text("70%", style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Text("Hızlı Başlangıç", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: Colors.white)),
              const SizedBox(height: 14),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.35,
                children: [
                  _HomeActionCard(
                    icon: Icons.menu_book_rounded,
                    title: "Kelimeler",
                    subtitle: "Derslere başla",
                    color: AppColors.primaryBlue,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => FlashcardScreen(lesson: ContentManager.lessons.first)));
                    },
                  ),
                  _HomeActionCard(
                    icon: Icons.forum_rounded,
                    title: "Diyaloglar",
                    subtitle: "Gerçek konuşmalar",
                    color: AppColors.accentPurple,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const DialogsScreen()));
                    },
                  ),
                  _HomeActionCard(
                    icon: Icons.category_rounded,
                    title: "Kategoriler",
                    subtitle: "Tüm dersler",
                    color: AppColors.accentOrange,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const LearnScreen()));
                    },
                  ),
                  _HomeActionCard(
                    icon: Icons.translate_rounded,
                    title: "Sözlük",
                    subtitle: "Kelime ara",
                    color: AppColors.accentGreen,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const DictionaryScreen()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _HomeActionCard({required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(15),
      onTap: onTap,
      radius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(color: color.withOpacity(0.16), borderRadius: BorderRadius.circular(13)),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 3),
          Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.50))),
        ],
      ),
    );
  }
}

// ============================================================
// ÖĞREN EKRANI
// ============================================================

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imageUrl: "assets/images/learn_bg.jpg",
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 15),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ÖĞREN", style: TextStyle(fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.w800, color: AppColors.primaryBlue)),
                        SizedBox(height: 5),
                        Text("Kelimeler", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.accentGreen.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.accentGreen.withOpacity(0.20)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_fire_department_rounded, color: AppColors.accentOrange, size: 18),
                        SizedBox(width: 5),
                        Text("37 gün", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                itemCount: ContentManager.lessons.length,
                itemBuilder: (context, index) {
                  final lesson = ContentManager.lessons[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: GlassCard(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => FlashcardScreen(lesson: lesson)));
                      },
                      padding: const EdgeInsets.all(17),
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.primaryBlue.withOpacity(0.14), borderRadius: BorderRadius.circular(17)),
                            child: Text(lesson.number, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: AppColors.primaryBlue)),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(lesson.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white)),
                                const SizedBox(height: 5),
                                Text(lesson.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, height: 1.4, color: Colors.white.withOpacity(0.52))),
                                const SizedBox(height: 8),
                                Text("${lesson.words.length} kelime", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.accentGreen)),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded, color: Colors.white54, size: 25),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FLASHCARD
// ============================================================

class FlashcardScreen extends StatefulWidget {
  final LessonCategory lesson;
  const FlashcardScreen({super.key, required this.lesson});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int currentWord = 0;
  bool learned = false;

  WordItem get word => widget.lesson.words[currentWord];

  void nextWord() {
    if (learned) {
      ProgressManager.instance.incrementLearnedWord();
    }

    if (currentWord < widget.lesson.words.length - 1) {
      setState(() {
        currentWord++;
        learned = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (currentWord + 1) / widget.lesson.words.length;

    return Scaffold(
      backgroundColor: AppColors.bgBottom,
      body: AppBackground(
        imageUrl: "assets/images/learn_bg.jpg",
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Row(
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded, color: Colors.white)),
                    Expanded(child: Text(widget.lesson.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white))),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${currentWord + 1} / ${widget.lesson.words.length}", style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.55))),
                        Text("${(progress * 100).round()}%", style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.primaryBlue)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(value: progress, minHeight: 7, backgroundColor: Colors.white.withOpacity(0.08), valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: GlassCard(
                      radius: 28,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(word.category.toUpperCase(), style: const TextStyle(fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.w800, color: AppColors.primaryBlue)),
                            const SizedBox(height: 20),
                            Container(
                              height: 190,
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white.withOpacity(0.1))),
                              child: Center(child: Text(word.emoji, style: const TextStyle(fontSize: 100))),
                            ),
                            const SizedBox(height: 25),
                            Text(word.russian, textAlign: TextAlign.center, style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.white)),
                            const SizedBox(height: 15),
                            Text(word.transcription, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white.withOpacity(0.55))),
                            const SizedBox(height: 28),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                              decoration: BoxDecoration(color: AppColors.primaryBlue.withOpacity(0.12), borderRadius: BorderRadius.circular(18)),
                              child: Text(word.turkish, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
                              child: const Icon(Icons.volume_up_rounded, color: AppColors.primaryBlue, size: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 25),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            learned = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: learned ? AppColors.accentGreen : AppColors.primaryBlue,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Text(learned ? "✓ ÖĞRENİLDİ" : "ÖĞRENDİM", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(onPressed: nextWord, child: const Text("Sonraki kelime →", style: TextStyle(color: Colors.white60, fontSize: 12))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DİYALOGLAR
// ============================================================

class DialogsScreen extends StatelessWidget {
  const DialogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imageUrl: "assets/images/test_bg.jpg",
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("ДИАЛОГИ", style: TextStyle(fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.w800, color: AppColors.accentPurple)),
                  const SizedBox(height: 5),
                  const Text("Gerçek Konuşmalar", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Colors.white)),
                  const SizedBox(height: 6),
                  Text("Günlük hayatta kullanabileceğin Rusça diyalogları öğren.", style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.55))),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                itemCount: ContentManager.dialogs.length,
                itemBuilder: (context, index) {
                  final dialog = ContentManager.dialogs[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: GlassCard(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DialogDetailScreen(topic: dialog)));
                      },
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          Container(
                            width: 58,
                            height: 58,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.accentPurple.withOpacity(0.14), borderRadius: BorderRadius.circular(18)),
                            child: Text(dialog.icon, style: const TextStyle(fontSize: 28)),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dialog.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white)),
                                const SizedBox(height: 5),
                                Text(dialog.subtitle, style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.52))),
                                const SizedBox(height: 8),
                                Text("${dialog.lines.length} konuşma", style: const TextStyle(fontSize: 10, color: AppColors.accentPurple, fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded, color: Colors.white54),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DİYALOG DETAY
// ============================================================

class DialogDetailScreen extends StatelessWidget {
  final DialogTopic topic;
  const DialogDetailScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBottom,
      body: AppBackground(
        imageUrl: "assets/images/test_bg.jpg",
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 12),
                child: Row(
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded, color: Colors.white)),
                    Expanded(child: Text(topic.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white))),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 35),
                  itemCount: topic.lines.length,
                  itemBuilder: (context, index) {
                    final line = topic.lines[index];
                    final bool isMe = line.speaker == "Sen";

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.88),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isMe ? AppColors.primaryBlue.withOpacity(0.90) : Colors.white.withOpacity(0.60),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(20),
                              topRight: const Radius.circular(20),
                              bottomLeft: Radius.circular(isMe ? 20 : 5),
                              bottomRight: Radius.circular(isMe ? 5 : 20),
                            ),
                            border: Border.all(color: Colors.white.withOpacity(0.60)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(line.speaker, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: isMe ? AppColors.primaryBlue : AppColors.accentPurple)),
                              const SizedBox(height: 8),
                              Text(line.russian, style: const TextStyle(fontSize: 18, height: 1.35, fontWeight: FontWeight.w800, color: Colors.white)),
                              const SizedBox(height: 8),
                              Text(line.transcription, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.white.withOpacity(0.60))),
                              const SizedBox(height: 9),
                              Text(line.turkish, style: TextStyle(fontSize: 12, height: 1.4, color: Colors.white.withOpacity(0.60))),
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.07)),
                                  child: const Icon(Icons.volume_up_rounded, size: 17, color: AppColors.primaryBlue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SÖZLÜK
// ============================================================

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    final words = ContentManager.dictionary.where((word) {
      final query = search.toLowerCase().trim();
      if (query.isEmpty) return true;
      return word.russian.toLowerCase().contains(query) ||
          word.turkish.toLowerCase().contains(query) ||
          word.transcription.toLowerCase().contains(query);
    }).toList();

    return AppBackground(
      imageUrl: "assets/images/dict_bg.jpg",
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("СЛОВАРЬ", style: TextStyle(fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.w800, color: AppColors.accentGreen)),
                        SizedBox(height: 5),
                        Text("Rusça Sözlük", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Colors.white)),
                      ],
                    ),
                  ),
                  Text("${words.length}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.accentGreen)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GlassCard(
                radius: 17,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: TextField(
                  onChanged: (value) => setState(() => search = value),
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: const Icon(Icons.search_rounded, color: Colors.white54),
                    hintText: "Rusça veya Türkçe ara...",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.40), fontSize: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: words.isEmpty
                  ? Center(child: Text("Kelime bulunamadı", style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 14)))
                  : ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                itemCount: words.length,
                itemBuilder: (context, index) {
                  final word = words[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: GlassCard(
                      radius: 18,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(word.russian, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: Colors.white)),
                                const SizedBox(height: 4),
                                Text(word.transcription, style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.white.withOpacity(0.48))),
                                const SizedBox(height: 5),
                                Text(word.turkish, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.accentGreen)),
                              ],
                            ),
                          ),
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.07)),
                            child: const Icon(Icons.volume_up_rounded, size: 18, color: AppColors.primaryBlue),
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.bookmark_border_rounded, size: 20, color: Colors.white.withOpacity(0.40)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PROFİL
// ============================================================

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ProgressManager.instance,
      builder: (context, _) {
        final progress = ProgressManager.instance;

        return AppBackground(
          imageUrl: "assets/images/profile_bg.jpg",
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
              child: Column(
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColors.primaryBlue, AppColors.accentPurple]),
                      boxShadow: [BoxShadow(color: AppColors.primaryBlue.withOpacity(0.30), blurRadius: 25, spreadRadius: 2)],
                    ),
                    child: const Center(child: Text("А", style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.white))),
                  ),
                  const SizedBox(height: 14),
                  const Text("Aleksei P.", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white)),
                  const SizedBox(height: 5),
                  Text("Rusça öğrenme yolculuğun devam ediyor", style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.52))),
                  const SizedBox(height: 22),
                  GlassCard(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("A1", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: AppColors.primaryBlue)),
                                  SizedBox(height: 3),
                                  Text("Başlangıç Seviyesi", style: TextStyle(fontSize: 12, color: Colors.white70)),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                              decoration: BoxDecoration(color: AppColors.accentGreen.withOpacity(0.13), borderRadius: BorderRadius.circular(12)),
                              child: const Text("PREMIUM", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1, color: AppColors.accentGreen)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const LinearProgressIndicator(
                            value: 0.62,
                            minHeight: 8,
                            backgroundColor: Color(0x18FFFFFF),
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Seviye ilerlemesi", style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.45))),
                            const Text("62%", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: _ProfileStat(icon: Icons.menu_book_rounded, value: "${progress.learnedWordsCount}", label: "Öğrenilen Kelime", color: AppColors.primaryBlue)),
                      const SizedBox(width: 10),
                      Expanded(child: _ProfileStat(icon: Icons.bolt_rounded, value: "${progress.userXP}", label: "Toplam XP", color: AppColors.accentOrange)),
                      const SizedBox(width: 10),
                      Expanded(child: _ProfileStat(icon: Icons.local_fire_department_rounded, value: "${progress.streakDays}", label: "Gün Serisi", color: AppColors.accentRed)),
                    ],
                  ),
                  const SizedBox(height: 18),
                  GlassCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        _ProfileMenuItem(icon: Icons.settings_rounded, title: "Ayarlar", onTap: () {}),
                        _ProfileMenuItem(icon: Icons.notifications_rounded, title: "Bildirimler", onTap: () {}),
                        _ProfileMenuItem(icon: Icons.info_outline_rounded, title: "Rusça Cepte Hakkında", onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _ProfileStat({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      radius: 18,
      child: Column(
        children: [
          Icon(icon, color: color, size: 21),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white)),
          const SizedBox(height: 3),
          Text(label, textAlign: TextAlign.center, maxLines: 2, style: TextStyle(fontSize: 8, height: 1.25, color: Colors.white.withOpacity(0.45))),
        ],
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70, size: 21),
            const SizedBox(width: 14),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white))),
            const Icon(Icons.chevron_right_rounded, color: Colors.white38, size: 21),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ANA (MAIN)
// ============================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase Hatası: $e");
  }

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const RuscaCepteApp());
}