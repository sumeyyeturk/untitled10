import 'package:flutter/material.dart';
import 'dart:ui'; // Glassmorphism (Blur) efekti için gerekli

// ---------------------------------------------------------------------------
// 1. DATA & MODELS
// ---------------------------------------------------------------------------

class Place {
  final String id;
  final String name;
  final String city;
  final String country;
  final String description;
  final String imagePath;
  final double rating;

  Place({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.description,
    required this.imagePath,
    this.rating = 4.8,
  });
}

class AppData {
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;
  AppData._internal();

  // Kullanıcı Bilgileri
  String userName = "Sümeyye Türk";
  String userEmail = "sumeyye@gmail.com";
  String userPhone = "+90 555 123 45 67";

  final ValueNotifier<List<Place>> favoritesNotifier = ValueNotifier([]);
  final ValueNotifier<String> currentCountryFilterNotifier = ValueNotifier("Turkey");

  void initData() {
    // Başlangıçta favori listesi boş veya örnek bir veriyle başlatılabilir
    favoritesNotifier.value = [];
  }

  void toggleFavorite(Place place) {
    final currentList = List<Place>.from(favoritesNotifier.value);
    if (currentList.contains(place)) {
      currentList.remove(place);
    } else {
      currentList.add(place);
    }
    favoritesNotifier.value = currentList;
  }

  bool isFavorite(Place place) => favoritesNotifier.value.contains(place);
}

// --- GÜNCELLENMİŞ MOCK DATA ---

final List<String> countries = [
  "Turkey", "France", "Italy", "South Korea",
  "Belgium", "Netherlands", "Japan", "Czech Republic", "Russia"
];

final List<Place> allPlaces = [
  // ================= TURKEY =================
  Place(
      id: 'tr_ist_1',
      name: 'Galata Tower',
      city: 'Istanbul',
      country: 'Turkey',
      description: 'Standing sentinel over Istanbul for centuries, the Galata Tower offers an unparalleled 360-degree panoramic view of the Golden Horn and the Bosphorus. Built by the Genoese in 1348, this medieval stone tower has served as a watchtower, a prison, and now a beloved landmark. As you ascend its historic steps, you are transported back in time, witnessing the layers of history that define Istanbul. The sunset view from the balcony is truly mesmerizing.',
      imagePath: 'assets/images/galata.jpg'
  ),
  Place(
      id: 'tr_ist_2',
      name: 'Hagia Sophia',
      city: 'Istanbul',
      country: 'Turkey',
      description: 'A masterpiece of architectural genius, Hagia Sophia stands as a testament to the grandeur of the Byzantine and Ottoman empires. Originally built as a cathedral in 537 AD, it remained the world\'s largest cathedral for nearly a thousand years. Its massive dome seems to float effortlessly above the prayer hall, adorned with stunning golden mosaics and intricate calligraphy.',
      imagePath: 'assets/images/ayasofya.jpg'
  ),
  Place(
      id: 'tr_ank_1',
      name: 'Anıtkabir',
      city: 'Ankara',
      country: 'Turkey',
      description: 'Anıtkabir is not just a mausoleum; it is a monumental tribute to Mustafa Kemal Atatürk, the founder of modern Turkey. Located in the heart of Ankara, its imposing architecture combines ancient Anatolian and Turkish motifs. The Road of Lions leads visitors to the Hall of Honor, where the sarcophagus resides. The surrounding Peace Park makes it an emotional journey.',
      imagePath: 'assets/images/anitkabir.jpg'
  ),
  Place(
      id: 'tr_ank_2',
      name: 'Ankara Castle',
      city: 'Ankara',
      country: 'Turkey',
      description: 'Perched atop a hill in the old quarter of Ankara, this historic fortification offers the best views of the capital city. Inside its walls, time seems to stand still; traditional Ottoman houses, quaint cafes, and antique shops line the narrow cobblestone streets, offering a charming contrast to the modern city below.',
      imagePath: 'assets/images/ankara_castle.jpg'
  ),
  Place(
      id: 'tr_izm_1',
      name: 'Ephesus',
      city: 'Izmir',
      country: 'Turkey',
      description: 'Ephesus is one of the most well-preserved ancient cities in the Mediterranean. Once a bustling Roman metropolis, it is home to the stunning Library of Celsus and the Great Theatre. Walking down the marble streets worn smooth by chariots and sandals over millennia, you can almost hear the whispers of history.',
      imagePath: 'assets/images/ephesus.jpg'
  ),
  Place(
      id: 'tr_izm_2',
      name: 'Clock Tower',
      city: 'Izmir',
      country: 'Turkey',
      description: 'The elegant Clock Tower in Konak Square is the symbol of Izmir. Its intricate Ottoman architecture makes it a popular meeting point. Surrounded by palm trees and the sea breeze of the Aegean, the tower stands as a beautiful reminder of the city\'s cosmopolitan history.',
      imagePath: 'assets/images/izmir_clock.jpg'
  ),
  Place(
      id: 'tr_ant_1',
      name: 'Düden Waterfalls',
      city: 'Antalya',
      country: 'Turkey',
      description: 'A refreshing escape from the Mediterranean heat, Düden Waterfalls is a natural wonder where water cascades dramatically into the sea. Whether you visit the Upper Düden for a picnic or watch the Lower Düden plunge directly into the Mediterranean Sea from a boat, the experience is magical.',
      imagePath: 'assets/images/duden.jpg'
  ),
  Place(
      id: 'tr_ant_2',
      name: 'Aspendos',
      city: 'Antalya',
      country: 'Turkey',
      description: 'Famous for having the best-preserved theatre of antiquity, Aspendos is a marvel of Roman engineering. Built in the 2nd century AD, the theatre is still used today for concerts thanks to its perfect acoustics. The view of the ancient structure against the Taurus Mountains is breathtaking.',
      imagePath: 'assets/images/aspendos.jpg'
  ),
  Place(
      id: 'tr_nev_1',
      name: 'Cappadocia',
      city: 'Nevşehir',
      country: 'Turkey',
      description: 'Cappadocia is a fairytale landscape of "fairy chimneys" and cave hotels. The highlight for many is waking up before dawn to watch hundreds of hot air balloons fill the sky over the surreal rock formations, creating a kaleidoscope of colors against the rising sun.',
      imagePath: 'assets/images/kapadokya.jpg'
  ),
  Place(
      id: 'tr_nev_2',
      name: 'Goreme Open Air',
      city: 'Nevşehir',
      country: 'Turkey',
      description: 'A UNESCO World Heritage site, containing some of the finest rock-cut churches with beautiful frescoes. Exploring the refectories and chapels carved by early Christians offers a profound insight into the region\'s religious history.',
      imagePath: 'assets/images/goreme.jpg'
  ),
  // --- MARDİN (GÜNCELLENDİ) ---
  Place(
      id: 'tr_mar_1',
      name: 'Mor Gabriel',
      city: 'Mardin',
      country: 'Turkey',
      description: 'Founded in 397 AD, Mor Gabriel is the oldest surviving Syriac Orthodox monastery in the world. Located on the historic Tur Abdin plateau, its golden stone architecture blends seamlessly with the arid landscape. The monastery is a living center of faith with intricate mosaics and peaceful courtyards.',
      imagePath: 'assets/images/mor_gabriel.jpg'
  ),
  Place(
      id: 'tr_mar_2',
      name: 'Zinciriye Medrese',
      city: 'Mardin',
      country: 'Turkey',
      description: 'Built in 1385, this stunning Islamic theological school sits just below the castle. Its fluted domes and grand portal are masterpieces of Artuqid architecture. The view from the rooftop over the endless Mesopotamian plains is absolutely breathtaking, especially at sunset.',
      imagePath: 'assets/images/zinciriye.jpg'
  ),
  Place(
      id: 'tr_mar_3',
      name: 'Dara Ruins',
      city: 'Mardin',
      country: 'Turkey',
      description: 'Known as the "Ephesus of the East," Dara is a spectacular ancient Roman fortress city carved into rock. The massive underground cisterns, rock-cut tombs, and agora are awe-inspiring and offer a mysterious journey into the past.',
      imagePath: 'assets/images/dara_ruins.jpg'
  ),
  // --- TRABZON (GÜNCELLENDİ) ---
  Place(
      id: 'tr_tra_1',
      name: 'Uzungöl',
      city: 'Trabzon',
      country: 'Turkey',
      description: 'Nestled between towering mountains covered in misty spruce forests, Uzungöl (Long Lake) is the jewel of the Black Sea. The mosque with its twin minarets reflected in the calm waters creates a postcard-perfect scene. It is a haven for nature lovers.',
      imagePath: 'assets/images/uzungol.jpg'
  ),
  Place(
      id: 'tr_tra_2',
      name: 'Sumela Monastery',
      city: 'Trabzon',
      country: 'Turkey',
      description: 'Clinging to a sheer cliff face 1,200 meters above sea level, Sumela is a Greek Orthodox monastery dedicated to the Virgin Mary. Reaching it requires a walk through a lush forest, revealing a structure that seems to defy gravity. The ancient frescoes inside are hauntingly beautiful.',
      imagePath: 'assets/images/sumela.jpg'
  ),
  Place(
      id: 'tr_tra_3',
      name: 'Atatürk Pavilion',
      city: 'Trabzon',
      country: 'Turkey',
      description: 'A beautiful example of early 20th-century architecture, this white mansion is set within fragrant pine forests. It was a gift to Atatürk and houses historical artifacts. The manicured gardens are perfect for a peaceful stroll overlooking the city.',
      imagePath: 'assets/images/ataturk_kosku.jpg'
  ),

  // ================= FRANCE =================
  Place(
      id: 'fr_par_1',
      name: 'Eiffel Tower',
      city: 'Paris',
      country: 'France',
      description: 'The Iron Lady of Paris needs no introduction. Built for the 1889 World\'s Fair, it has become the global symbol of romance. Whether you picnic on the Champ de Mars or take the elevator to the summit, the experience is unforgettable.',
      imagePath: 'assets/images/eiffel.jpg'
  ),
  Place(
      id: 'fr_par_2',
      name: 'Louvre Museum',
      city: 'Paris',
      country: 'France',
      description: 'Home to the Mona Lisa, the Louvre is the world\'s largest art museum. Entering through the iconic glass pyramid, visitors descend into a vast palace that houses over 35,000 works of art.',
      imagePath: 'assets/images/louvre.jpg'
  ),
  Place(
      id: 'fr_nic_1',
      name: 'Promenade',
      city: 'Nice',
      country: 'France',
      description: 'The Promenade des Anglais is the most famous stretch of seafront in Nice. Lined with palm trees and legendary hotels, it captures the essence of the French Riviera lifestyle.',
      imagePath: 'assets/images/nice_promenade.jpg'
  ),
  Place(
      id: 'fr_nic_2',
      name: 'Castle Hill',
      city: 'Nice',
      country: 'France',
      description: 'For the best views in Nice, a trip up to Castle Hill is essential. It offers a stunning man-made waterfall and panoramic views of the red rooftops and azure sea.',
      imagePath: 'assets/images/nice_castle.jpg'
  ),
  Place(
      id: 'fr_lyo_1',
      name: 'Basilica Notre-Dame',
      city: 'Lyon',
      country: 'France',
      description: 'Perched on the Fourvière hill, this basilica watches over Lyon. Its architecture is a unique blend of styles featuring intricate mosaics. The view from its terrace is panoramic.',
      imagePath: 'assets/images/lyon_basilica.jpg'
  ),
  Place(
      id: 'fr_lyo_2',
      name: 'Vieux Lyon',
      city: 'Lyon',
      country: 'France',
      description: 'Vieux Lyon is one of the largest Renaissance districts in Europe. Its charm lies in its narrow cobblestone streets and hidden passageways known as "traboules."',
      imagePath: 'assets/images/vieux_lyon.jpg'
  ),
  Place(
      id: 'fr_bor_1',
      name: 'Place de la Bourse',
      city: 'Bordeaux',
      country: 'France',
      description: 'A symbol of Bordeaux\'s elegance. Its most famous feature is the "Water Mirror," the world\'s largest reflecting pool, creating a magical reflection of the buildings.',
      imagePath: 'assets/images/bordeaux_bourse.jpg'
  ),
  Place(
      id: 'fr_bor_2',
      name: 'Cité du Vin',
      city: 'Bordeaux',
      country: 'France',
      description: 'This ultra-modern museum is a tribute to wine. Its bold architecture resembles the swirl of wine in a glass. The visit concludes with a tasting and a 360-degree view.',
      imagePath: 'assets/images/bordeaux_wine.jpg'
  ),
  Place(
      id: 'fr_mar_1',
      name: 'Old Port',
      city: 'Marseille',
      country: 'France',
      description: 'The Vieux-Port has been the beating heart of Marseille for over 2,600 years. Filled with yachts and a lively fish market, it is the perfect place to start exploring.',
      imagePath: 'assets/images/marseille_port.jpg'
  ),
  Place(
      id: 'fr_mar_2',
      name: 'Notre-Dame',
      city: 'Marseille',
      country: 'France',
      description: 'Known as "The Good Mother," this basilica sits on the highest point in Marseille. It offers the most spectacular panorama of the city and the Mediterranean Sea.',
      imagePath: 'assets/images/marseille_basilica.jpg'
  ),

  // ================= ITALY =================
  Place(
      id: 'it_rom_1',
      name: 'Colosseum',
      city: 'Rome',
      country: 'Italy',
      description: 'The largest amphitheatre ever built, a symbol of Imperial Rome where gladiators once fought. An awe-inspiring engineering marvel that lets you walk in the footsteps of history.',
      imagePath: 'assets/images/colosseum.jpg'
  ),
  Place(
      id: 'it_rom_2',
      name: 'Trevi Fountain',
      city: 'Rome',
      country: 'Italy',
      description: 'A masterpiece of Baroque art. Legend says that if you throw a coin into the fountain with your right hand over your left shoulder, you will one day return to Rome.',
      imagePath: 'assets/images/trevi.jpg'
  ),
  Place(
      id: 'it_ven_1',
      name: 'Grand Canal',
      city: 'Venice',
      country: 'Italy',
      description: 'The main artery of Venice, lined with magnificent Renaissance palaces. Taking a Vaporetto or gondola ride here is a magical experience.',
      imagePath: 'assets/images/venice_canal.jpg'
  ),
  Place(
      id: 'it_ven_2',
      name: 'St. Mark\'s Square',
      city: 'Venice',
      country: 'Italy',
      description: 'The "drawing room of Europe." Dominated by the basilica and bell tower, the square\'s vibrant energy and architectural beauty are captivating.',
      imagePath: 'assets/images/venice_square.jpg'
  ),
  Place(
      id: 'it_flo_1',
      name: 'Florence Cathedral',
      city: 'Florence',
      country: 'Italy',
      description: 'The Duomo is the icon of Florence. Its exterior is a mix of pink, white, and green marble. Climbing the dome offers an unmatched view of the Tuscan capital.',
      imagePath: 'assets/images/florence_duomo.jpg'
  ),
  Place(
      id: 'it_flo_2',
      name: 'Ponte Vecchio',
      city: 'Florence',
      country: 'Italy',
      description: 'A medieval stone bridge famous for the jewelry shops built along it. Walking across it at sunset is one of the most romantic experiences in Italy.',
      imagePath: 'assets/images/ponte_vecchio.jpg'
  ),
  Place(
      id: 'it_mil_1',
      name: 'Duomo di Milano',
      city: 'Milan',
      country: 'Italy',
      description: 'A massive Gothic cathedral with thousands of statues. Visitors can walk on the roof terraces among the spires for a unique view of Milan.',
      imagePath: 'assets/images/milan_duomo.jpg'
  ),
  Place(
      id: 'it_mil_2',
      name: 'Galleria Emanuele',
      city: 'Milan',
      country: 'Italy',
      description: 'One of the world\'s oldest shopping malls, celebrating luxury with its glass dome and mosaic floors. A magnificent place to experience Milanese elegance.',
      imagePath: 'assets/images/milan_galleria.jpg'
  ),
  Place(
      id: 'it_nap_1',
      name: 'Pompeii',
      city: 'Naples',
      country: 'Italy',
      description: 'Frozen in time by Mount Vesuvius, Pompeii offers a hauntingly detailed look at Roman life. Walking its preserved streets is a deeply moving experience.',
      imagePath: 'assets/images/pompeii.jpg'
  ),
  Place(
      id: 'it_nap_2',
      name: 'Mount Vesuvius',
      city: 'Naples',
      country: 'Italy',
      description: 'The only active volcano on the European mainland. A hike to the rim offers a raw look at nature\'s power and spectacular views of the bay.',
      imagePath: 'assets/images/vesuvius.jpg'
  ),

  // ================= SOUTH KOREA =================
  Place(
      id: 'kr_seo_1',
      name: 'Gyeongbokgung',
      city: 'Seoul',
      country: 'South Korea',
      description: 'The main royal palace of the Joseon Dynasty. Visitors often rent Hanbok to wander the grounds and witness the colorful Changing of the Guard ceremony.',
      imagePath: 'assets/images/gyeongbokgung.jpg'
  ),
  Place(
      id: 'kr_seo_2',
      name: 'N Seoul Tower',
      city: 'Seoul',
      country: 'South Korea',
      description: 'An iconic landmark on Namsan Mountain. Famous for "Locks of Love" and offering the best panoramic views of Seoul\'s cityscape.',
      imagePath: 'assets/images/seoul_tower.jpg'
  ),
  Place(
      id: 'kr_bus_1',
      name: 'Gamcheon Village',
      city: 'Busan',
      country: 'South Korea',
      description: 'The "Machu Picchu of Busan," a hillside village of pastel-colored houses and artistic murals. A vibrant maze offering stunning harbor views.',
      imagePath: 'assets/images/gamcheon.jpg'
  ),
  Place(
      id: 'kr_bus_2',
      name: 'Haeundae Beach',
      city: 'Busan',
      country: 'South Korea',
      description: 'Korea\'s most famous beach, bustling with energy, luxury hotels, and festivals. A unique blend of urban excitement and seaside relaxation.',
      imagePath: 'assets/images/haeundae.jpg'
  ),
  Place(
      id: 'kr_jej_1',
      name: 'Seongsan Ilchulbong',
      city: 'Jeju',
      country: 'South Korea',
      description: 'Known as "Sunrise Peak," a volcanic tuff cone rising from the sea. The steep climb rewards hikers with breathtaking crater and ocean views.',
      imagePath: 'assets/images/jeju_sunrise.jpg'
  ),
  Place(
      id: 'kr_jej_2',
      name: 'Jeongbang Falls',
      city: 'Jeju',
      country: 'South Korea',
      description: 'One of the few waterfalls in Asia that falls directly into the ocean. The sight of water crashing onto black volcanic rocks is spectacular.',
      imagePath: 'assets/images/jeju_waterfall.jpg'
  ),
  Place(
      id: 'kr_inc_1',
      name: 'Incheon Park',
      city: 'Incheon',
      country: 'South Korea',
      description: 'A massive urban oasis with a botanical garden and zoo. Especially beautiful during the cherry blossom season and autumn.',
      imagePath: 'assets/images/incheon_park.jpg'
  ),
  Place(
      id: 'kr_inc_2',
      name: 'Chinatown',
      city: 'Incheon',
      country: 'South Korea',
      description: 'Korea\'s only official Chinatown. A vibrant explosion of red lanterns and street food, and the birthplace of Jajangmyeon.',
      imagePath: 'assets/images/incheon_chinatown.jpg'
  ),
  Place(
      id: 'kr_gye_1',
      name: 'Bulguksa Temple',
      city: 'Gyeongju',
      country: 'South Korea',
      description: 'A masterpiece of Buddhist art and UNESCO site. Represents the utopian ideal of the Buddha land with its harmonious stone architecture.',
      imagePath: 'assets/images/bulguksa.jpg'
  ),
  Place(
      id: 'kr_gye_2',
      name: 'Donggung Palace',
      city: 'Gyeongju',
      country: 'South Korea',
      description: 'Ancient royal banquet site. Most spectacular at night when the illuminated pavilions reflect perfectly on the tranquil Wolji Pond.',
      imagePath: 'assets/images/donggung.jpg'
  ),

  // ================= BELGIUM =================
  Place(
      id: 'be_bru_1',
      name: 'Grand Place',
      city: 'Brussels',
      country: 'Belgium',
      description: 'Considered the most beautiful square in the world, surrounded by opulent guildhalls. Famous for its biennial flower carpet.',
      imagePath: 'assets/images/grand_place.jpg'
  ),
  Place(
      id: 'be_bru_2',
      name: 'Atomium',
      city: 'Brussels',
      country: 'Belgium',
      description: 'A futuristic structure representing an iron crystal. Visitors can explore the spheres and enjoy panoramic views of Brussels.',
      imagePath: 'assets/images/atomium.jpg'
  ),
  Place(
      id: 'be_brg_1',
      name: 'Belfry of Bruges',
      city: 'Brugge',
      country: 'Belgium',
      description: 'A medieval bell tower dominating the market square. Climbing it offers fantastic views of the gabled rooftops and canals.',
      imagePath: 'assets/images/brugge_belfry.jpg'
  ),
  Place(
      id: 'be_brg_2',
      name: 'Lake of Love',
      city: 'Brugge',
      country: 'Belgium',
      description: 'Minnewater is a romantic oasis home to swans. Legend says walking the bridge with a partner ensures eternal love.',
      imagePath: 'assets/images/brugge_lake.jpg'
  ),
  Place(
      id: 'be_ghe_1',
      name: 'Gravensteen',
      city: 'Ghent',
      country: 'Belgium',
      description: 'The "Castle of the Counts," a formidable medieval fortress with a moat and torture museum located in the city center.',
      imagePath: 'assets/images/gravensteen.jpg'
  ),
  Place(
      id: 'be_ghe_2',
      name: 'Saint Bavo',
      city: 'Ghent',
      country: 'Belgium',
      description: 'A majestic cathedral housing the "Adoration of the Mystic Lamb," one of the most influential paintings in art history.',
      imagePath: 'assets/images/saint_bavo.jpg'
  ),

  // ================= NETHERLANDS =================
  Place(
      id: 'nl_ams_1',
      name: 'Rijksmuseum',
      city: 'Amsterdam',
      country: 'Netherlands',
      description: 'The crown jewel of Dutch museums, housing masterpieces by Rembrandt and Vermeer in a stunning Gothic-Renaissance building.',
      imagePath: 'assets/images/rijksmuseum.jpg'
  ),
  Place(
      id: 'nl_ams_2',
      name: 'Canal Ring',
      city: 'Amsterdam',
      country: 'Netherlands',
      description: 'The defining feature of the city. A boat cruise offers unique views of the tall, narrow canal houses and illuminated bridges.',
      imagePath: 'assets/images/amsterdam_canals.jpg'
  ),
  Place(
      id: 'nl_rot_1',
      name: 'Cube Houses',
      city: 'Rotterdam',
      country: 'Netherlands',
      description: 'Striking yellow, tilted cube homes designed by Piet Blom. A unique example of modern architecture representing trees in a forest.',
      imagePath: 'assets/images/cube_houses.jpg'
  ),
  Place(
      id: 'nl_rot_2',
      name: 'Erasmus Bridge',
      city: 'Rotterdam',
      country: 'Netherlands',
      description: 'Nicknamed "The Swan," this graceful bridge connects the city and showcases Rotterdam\'s innovative spirit.',
      imagePath: 'assets/images/erasmus_bridge.jpg'
  ),

  // ================= JAPAN =================
  Place(
      id: 'jp_tok_1',
      name: 'Senso-ji',
      city: 'Tokyo',
      country: 'Japan',
      description: 'Tokyo\'s oldest temple, located in Asakusa. Famous for its giant red lantern and the vibrant Nakamise shopping street.',
      imagePath: 'assets/images/sensoji.jpg'
  ),
  Place(
      id: 'jp_tok_2',
      name: 'Shibuya Crossing',
      city: 'Tokyo',
      country: 'Japan',
      description: 'The busiest intersection in the world. An electrifying spectacle of organized chaos that defines Tokyo\'s modern energy.',
      imagePath: 'assets/images/shibuya.jpg'
  ),
  Place(
      id: 'jp_kyo_1',
      name: 'Fushimi Inari',
      city: 'Kyoto',
      country: 'Japan',
      description: 'Famous for its thousands of vermilion torii gates straddling trails up the sacred mountain. A mystical and iconic experience.',
      imagePath: 'assets/images/kyoto_inari.jpg'
  ),
  Place(
      id: 'jp_kyo_2',
      name: 'Kinkaku-ji',
      city: 'Kyoto',
      country: 'Japan',
      description: 'The Golden Pavilion, covered in gold leaf and reflecting in the pond. A symbol of harmony between nature and architecture.',
      imagePath: 'assets/images/kinkakuji.jpg'
  ),
  Place(
      id: 'jp_osa_1',
      name: 'Osaka Castle',
      city: 'Osaka',
      country: 'Japan',
      description: 'A powerful symbol of history with impressive stone walls and a museum inside. The park is beautiful during cherry blossom season.',
      imagePath: 'assets/images/osaka_castle.jpg'
  ),
  Place(
      id: 'jp_osa_2',
      name: 'Dotonbori',
      city: 'Osaka',
      country: 'Japan',
      description: 'The gastronomic heart of Osaka with neon lights and giant signs. The best place to try street food like Takoyaki.',
      imagePath: 'assets/images/dotonbori.jpg'
  ),

  // ================= CZECH REPUBLIC (YENİ EKLENDİ) =================
  Place(
      id: 'cz_pra_1',
      name: 'Charles Bridge',
      city: 'Prague',
      country: 'Czech Republic',
      description: 'A historic stone bridge lined with 30 statues of saints. Walking across at dawn offers magical views of the city spires rising from the mist.',
      imagePath: 'assets/images/charles_bridge.jpg'
  ),
  Place(
      id: 'cz_pra_2',
      name: 'Prague Castle',
      city: 'Prague',
      country: 'Czech Republic',
      description: 'The largest ancient castle complex in the world. Home to St. Vitus Cathedral, it offers stunning views over Prague\'s red rooftops.',
      imagePath: 'assets/images/prague_castle.jpg'
  ),
  Place(
      id: 'cz_krum_1',
      name: 'Český Krumlov',
      city: 'Český Krumlov',
      country: 'Czech Republic',
      description: 'A fairytale town in South Bohemia. Its historic center, centered around a spectacular castle and meandering river, is a UNESCO World Heritage site that feels like stepping back into the Middle Ages.',
      imagePath: 'assets/images/cesky_krumlov.jpg'
  ),
  Place(
      id: 'cz_karl_1',
      name: 'Karlovy Vary',
      city: 'Karlovy Vary',
      country: 'Czech Republic',
      description: 'A world-famous spa town known for its thermal springs and colorful architecture. Visitors can drink the mineral water from special porcelain cups while strolling along the elegant colonnades.',
      imagePath: 'assets/images/karlovy_vary.jpg'
  ),
  Place(
      id: 'cz_kut_1',
      name: 'Sedlec Ossuary',
      city: 'Kutná Hora',
      country: 'Czech Republic',
      description: 'The famous "Bone Church." A small chapel decorated artistically with the bones of over 40,000 people. It includes a massive bone chandelier and is a uniquely macabre yet fascinating historical site.',
      imagePath: 'assets/images/sedlec_ossuary.jpg'
  ),

  // ================= RUSSIA =================
  Place(
      id: 'ru_mos_1',
      name: 'Red Square',
      city: 'Moscow',
      country: 'Russia',
      description: 'The heart and soul of Russia, surrounded by the Kremlin and St. Basil\'s. It has witnessed the nation\'s most significant events.',
      imagePath: 'assets/images/red_square.jpg'
  ),
  Place(
      id: 'ru_mos_2',
      name: 'Saint Basil',
      city: 'Moscow',
      country: 'Russia',
      description: 'With its colorful onion domes, it looks like a fairy tale confection. A unique masterpiece of Russian architecture.',
      imagePath: 'assets/images/saint_basil.jpg'
  ),
  Place(
      id: 'ru_stp_1',
      name: 'Hermitage',
      city: 'St. Petersburg',
      country: 'Russia',
      description: 'Located in the Winter Palace, one of the world\'s largest museums. The gold-dripping rooms offer a glimpse into the lavish life of the Tsars.',
      imagePath: 'assets/images/hermitage.jpg'
  ),
];

// ---------------------------------------------------------------------------
// 2. ANIMATION HELPER
// ---------------------------------------------------------------------------
class FadeInSlide extends StatefulWidget {
  final Widget child;
  final double delay;
  const FadeInSlide({super.key, required this.child, this.delay = 0});

  @override
  State<FadeInSlide> createState() => _FadeInSlideState();
}

class _FadeInSlideState extends State<FadeInSlide> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _offset = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _opacity, child: SlideTransition(position: _offset, child: widget.child));
  }
}

// ---------------------------------------------------------------------------
// 3. MAIN ENTRY & THEME
// ---------------------------------------------------------------------------

void main() {
  AppData().initData();
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF212121),
          primary: const Color(0xFF212121),
          surface: const Color(0xFFFFFFFF),
          background: const Color(0xFFF5F5F5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(color: Color(0xFF1A1A1A), fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.5),
          iconTheme: IconThemeData(color: Color(0xFF1A1A1A)),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}

// ---------------------------------------------------------------------------
// 4. AUTH SCREEN
// ---------------------------------------------------------------------------

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginMode = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitAuth() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill in all fields.")));
      return;
    }
    if (!_isLoginMode) {
      if (_nameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter your name.")));
        return;
      }
      AppData().userName = _nameController.text;
      AppData().userEmail = _emailController.text;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Account Created!"), backgroundColor: Colors.green[600]));
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainContainer()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/intro_bg.jpg', fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[800])),
          ),
          Positioned.fill(child: Container(color: Colors.black.withOpacity(0.3))),
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter, end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FadeInSlide(delay: 0.1, child: Text("Explore\nThe World.", style: TextStyle(fontSize: 48, height: 1.1, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1))),
                  const SizedBox(height: 10),
                  const FadeInSlide(delay: 0.2, child: Text("Discover monuments, cultures, and breathtaking landscapes.", style: TextStyle(fontSize: 16, color: Colors.white70))),
                  const SizedBox(height: 40),
                  FadeInSlide(
                    delay: 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.2))),
                          child: Column(
                            children: [
                              if (!_isLoginMode) ...[
                                _glassTextField(Icons.person_outline, "Name Surname", controller: _nameController),
                                const SizedBox(height: 12),
                              ],
                              _glassTextField(Icons.email_outlined, "Email", controller: _emailController),
                              const SizedBox(height: 12),
                              _glassTextField(Icons.lock_outline, "Password", obscure: true, controller: _passwordController),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity, height: 55,
                                child: ElevatedButton(
                                  onPressed: _submitAuth,
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                                  child: Text(_isLoginMode ? "Login" : "Sign Up", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () => setState(() => _isLoginMode = !_isLoginMode),
                                child: Text(_isLoginMode ? "Don't have an account? Sign Up" : "Already have an account? Login", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glassTextField(IconData icon, String hint, {bool obscure = false, TextEditingController? controller}) {
    return TextField(
      controller: controller, obscureText: obscure, style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70), hintText: hint, hintStyle: const TextStyle(color: Colors.white60), filled: true, fillColor: Colors.black.withOpacity(0.2), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 5. MAIN CONTAINER
// ---------------------------------------------------------------------------

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});
  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _idx = 0;
  final _pages = const [HomeScreen(), SearchScreen(), FavoritesScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_idx],
      bottomNavigationBar: Container(
        color: const Color(0xFFF5F5F5),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(Icons.grid_view_rounded, "Home", 0),
                _navItem(Icons.search_rounded, "Search", 1),
                _navItem(Icons.favorite_rounded, "Saved", 2),
                _navItem(Icons.person_rounded, "Profile", 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = _idx == index;
    return GestureDetector(
      onTap: () => setState(() => _idx = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE53935) : Colors.transparent, // Kırmızı vurgu
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 24),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 6. HOME SCREEN
// ---------------------------------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendedPlaces = List<Place>.from(allPlaces);
    recommendedPlaces.shuffle();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello, ${AppData().userName.split(' ')[0]}", style: const TextStyle(color: Colors.grey, fontSize: 16)),
                      const Text("Where to next?", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, letterSpacing: -0.5, color: Color(0xFF212121))),
                    ],
                  ),
                  const CircleAvatar(radius: 22, backgroundImage: AssetImage('assets/images/avatar.jpg')),
                ],
              ),
              const SizedBox(height: 20),

              // COUNTRY Filter
              SizedBox(
                height: 40,
                child: ValueListenableBuilder<String>(
                  valueListenable: AppData().currentCountryFilterNotifier,
                  builder: (context, currentCountry, _) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        final country = countries[index];
                        final isSel = country == currentCountry;
                        return GestureDetector(
                          onTap: () => AppData().currentCountryFilterNotifier.value = country,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSel ? const Color(0xFF212121) : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: isSel ? null : Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(country, style: TextStyle(color: isSel ? Colors.white : Colors.black87, fontWeight: FontWeight.w600)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // POPULAR SECTION (Filtered by Country)
              ValueListenableBuilder<String>(
                valueListenable: AppData().currentCountryFilterNotifier,
                builder: (context, currentCountry, _) {
                  final countryPlaces = allPlaces.where((p) => p.country == currentCountry).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Explore $currentCountry", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const Text("View All", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 220,
                        child: countryPlaces.isEmpty
                            ? const Center(child: Text("No places added for this country yet."))
                            : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: countryPlaces.length,
                          itemBuilder: (context, index) {
                            return FadeInSlide(
                              delay: index * 0.1,
                              child: _buildCinematicCard(context, countryPlaces[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),
              const Text("Discover the World", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
              const SizedBox(height: 12),

              // PINTEREST GRID
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: recommendedPlaces.length > 20 ? 20 : recommendedPlaces.length,
                itemBuilder: (context, index) {
                  final place = recommendedPlaces[index];
                  return FadeInSlide(
                    delay: index * 0.05,
                    child: _buildPinterestCard(context, place),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCinematicCard(BuildContext context, Place place) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetailScreen(place: place))),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(place.imagePath, fit: BoxFit.cover, errorBuilder: (c,e,s)=> Container(color: Colors.grey.shade300, child: const Icon(Icons.image, color: Colors.grey))),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      stops: const [0.5, 1.0],
                      colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15, left: 12, right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(place.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white70, size: 12),
                        const SizedBox(width: 2),
                        Expanded(child: Text(place.city, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white70, fontSize: 10))),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinterestCard(BuildContext context, Place place) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetailScreen(place: place))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(place.imagePath, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s)=> Container(color: Colors.grey.shade300)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 12, color: Colors.grey),
                      const SizedBox(width: 2),
                      Expanded(child: Text("${place.city}, ${place.country}", style: const TextStyle(fontSize: 12, color: Colors.grey), overflow: TextOverflow.ellipsis)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 7. SEARCH SCREEN
// ---------------------------------------------------------------------------
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = "";

  void _showFullImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSearching = _query.isNotEmpty;
    final filteredPlaces = isSearching
        ? allPlaces.where((p) =>
    p.name.toLowerCase().contains(_query.toLowerCase()) ||
        p.city.toLowerCase().contains(_query.toLowerCase()) ||
        p.country.toLowerCase().contains(_query.toLowerCase())
    ).toList()
        : <Place>[];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Search", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
              const SizedBox(height: 20),
              TextField(
                onChanged: (val) => setState(() => _query = val),
                decoration: InputDecoration(
                  hintText: "Where to next?",
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: Colors.grey.shade200)),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: !isSearching
                    ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.travel_explore, size: 80, color: Colors.grey.shade300),
                      const SizedBox(height: 16),
                      const Text("Find your next adventure.", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                )
                    : filteredPlaces.isEmpty
                    ? const Center(child: Text("No places found."))
                    : ListView.builder(
                  itemCount: filteredPlaces.length,
                  itemBuilder: (context, index) {
                    final place = filteredPlaces[index];
                    return FadeInSlide(
                      delay: 0.1,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                        child: ListTile(
                          leading: GestureDetector(
                            onTap: () => _showFullImage(context, place.imagePath),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(place.imagePath, width: 50, height: 50, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(color:Colors.grey.shade300)),
                            ),
                          ),
                          title: Text(place.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${place.city}, ${place.country}"),
                          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetailScreen(place: place))),
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

// ---------------------------------------------------------------------------
// 8. FAVORITES SCREEN
// ---------------------------------------------------------------------------
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved")),
      body: ValueListenableBuilder<List<Place>>(
        valueListenable: AppData().favoritesNotifier,
        builder: (context, favorites, _) {
          if (favorites.isEmpty) return const Center(child: Text("Your collection is empty.", style: TextStyle(color: Colors.grey)));
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final place = favorites[index];
              return FadeInSlide(
                delay: index * 0.1,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetailScreen(place: place))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))]),
                    child: Column(
                      children: [
                        ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), child: Image.asset(place.imagePath, height: 160, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(color:Colors.grey))),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(place.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text("${place.city}, ${place.country}", style: const TextStyle(color: Colors.grey))]),
                              IconButton(icon: const Icon(Icons.favorite, color: Color(0xFF212121)), onPressed: () => AppData().toggleFavorite(place)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 9. ACCOUNT SCREEN
// ---------------------------------------------------------------------------
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // Geri dönüldüğünde sayfayı yenilemek için
  void _openSetting(BuildContext context, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => _DetailSettingScreen(title: title))).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
              decoration: const BoxDecoration(
                color: Color(0xFF2D2D2D),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white.withOpacity(0.2), width: 1)),
                    child: const CircleAvatar(radius: 45, backgroundImage: AssetImage('assets/images/avatar.jpg')),
                  ),
                  const SizedBox(height: 16),
                  Text(AppData().userName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 0.5)),
                  const SizedBox(height: 4),
                  Text(AppData().userEmail, style: const TextStyle(color: Colors.white54, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // SETTINGS LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10, bottom: 10), child: Text("General", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87))),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 15, offset: const Offset(0, 5))]),
                    child: Column(
                      children: [
                        _settingsTile(context, Icons.person_outline, "Account Information"),
                        _divider(),
                        _settingsTile(context, Icons.settings_outlined, "Preferences"),
                        _divider(),
                        _settingsTile(context, Icons.lock_outline, "Security"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Padding(padding: EdgeInsets.only(left: 10, bottom: 10), child: Text("Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87))),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 15, offset: const Offset(0, 5))]),
                    child: Column(
                      children: [
                        _settingsTile(context, Icons.help_outline, "Help Center"),
                        _divider(),
                        _settingsTile(context, Icons.info_outline, "About App"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthScreen())),
                    style: TextButton.styleFrom(foregroundColor: Colors.redAccent, padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.logout, size: 20), SizedBox(width: 8), Text("Log Out", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))]),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: Colors.black87, size: 20)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      onTap: () => _openSetting(context, title),
    );
  }
  Widget _divider() => Divider(height: 1, color: Colors.grey[100], indent: 70, endIndent: 20);
}

// ---------------------------------------------------------------------------
// 9.1 DETAY AYAR EKRANI
// ---------------------------------------------------------------------------
class _DetailSettingScreen extends StatefulWidget {
  final String title;
  const _DetailSettingScreen({required this.title});

  @override
  State<_DetailSettingScreen> createState() => _DetailSettingScreenState();
}

class _DetailSettingScreenState extends State<_DetailSettingScreen> {
  // Controllerlar
  late TextEditingController _nameCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _phoneCtrl;

  // Preferences State
  bool _pushNotifications = true;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: AppData().userName);
    _emailCtrl = TextEditingController(text: AppData().userEmail);
    _phoneCtrl = TextEditingController(text: AppData().userPhone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (widget.title) {
      case "Account Information":
        return Column(
          children: [
            _buildEditableField("Full Name", _nameCtrl),
            const SizedBox(height: 20),
            _buildEditableField("Email", _emailCtrl),
            const SizedBox(height: 20),
            _buildEditableField("Phone", _phoneCtrl),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF212121), foregroundColor: Colors.white),
                  onPressed: (){
                    // Verileri kaydet
                    AppData().userName = _nameCtrl.text;
                    AppData().userEmail = _emailCtrl.text;
                    AppData().userPhone = _phoneCtrl.text;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile Updated Successfully!")));
                    Navigator.pop(context);
                  },
                  child: const Text("Save Changes")
              ),
            )
          ],
        );
      case "Preferences":
        return Column(
          children: [
            SwitchListTile(
                activeColor: Colors.green,
                value: _pushNotifications,
                onChanged: (v) => setState(() => _pushNotifications = v),
                title: const Text("Push Notifications")
            ),
            SwitchListTile(
                activeColor: Colors.green,
                value: _darkMode,
                onChanged: (v) => setState(() => _darkMode = v),
                title: const Text("Dark Mode")
            ),
            const Divider(),
            ListTile(title: const Text("Language"), subtitle: const Text("English"), trailing: const Icon(Icons.chevron_right), onTap: (){}),
            ListTile(title: const Text("Currency"), subtitle: const Text("USD"), trailing: const Icon(Icons.chevron_right), onTap: (){}),
          ],
        );
      case "Security":
        return Column(
          children: [
            _buildEditableField("Current Password", TextEditingController(), obscure: true, hint: "Enter current password"),
            const SizedBox(height: 20),
            _buildEditableField("New Password", TextEditingController(), obscure: true, hint: "Enter new password"),
            const SizedBox(height: 20),
            _buildEditableField("Confirm Password", TextEditingController(), obscure: true, hint: "Confirm new password"),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password changed successfully!")));
                    Navigator.pop(context);
                  },
                  child: const Text("Update Password")
              ),
            )
          ],
        );
      case "Help Center":
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("FAQ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ExpansionTile(title: Text("How do I book a trip?"), children: [Padding(padding: EdgeInsets.all(16), child: Text("Currently this is a discovery app designed to help you find the best places. Booking features are coming in the next update!"))]),
            ExpansionTile(title: Text("Is this app free?"), children: [Padding(padding: EdgeInsets.all(16), child: Text("Yes, completely free to explore and save your favorite destinations."))]),
            ExpansionTile(title: Text("How do I contact support?"), children: [Padding(padding: EdgeInsets.all(16), child: Text("You can email us at support@travelapp.com or call us at +1 234 567 890."))]),
            ExpansionTile(title: Text("Can I use this offline?"), children: [Padding(padding: EdgeInsets.all(16), child: Text("Some features require an internet connection, but your saved favorites are available offline."))]),
          ],
        );
      case "About App":
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.travel_explore, size: 80, color: Colors.black87),
              const SizedBox(height: 20),
              const Text("Global Travel", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text("Version 1.2.0", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 40),
              const Text("Developed by You", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Text("© 2024 All rights reserved.", style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 30),
              OutlinedButton(onPressed: (){}, child: const Text("Check for Updates"))
            ],
          ),
        );
      default:
        return const Center(child: Text("Content coming soon."));
    }
  }

  Widget _buildEditableField(String label, TextEditingController controller, {bool obscure = false, String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
          ),
        )
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// 10. DETAIL SCREEN
// ---------------------------------------------------------------------------
class PlaceDetailScreen extends StatelessWidget {
  final Place place;
  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // ÜST KISIM: FOTOĞRAF
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: Colors.white,
            leading: _blurBtn(
                context,
                icon: Icons.arrow_back,
                onTap: () => Navigator.pop(context)
            ),
            actions: [
              ValueListenableBuilder(
                valueListenable: AppData().favoritesNotifier,
                builder: (c, f, _) => Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: _blurBtn(context,
                      icon: AppData().isFavorite(place) ? Icons.favorite : Icons.favorite_border,
                      color: AppData().isFavorite(place) ? Colors.red : Colors.white,
                      onTap: () => AppData().toggleFavorite(place)
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(place.imagePath, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: Colors.grey.shade300, child: const Center(child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey)))),
            ),
          ),

          // ALT KISIM: YAZILAR
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      place.name,
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5, color: Colors.black)
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text("${place.city}, ${place.country}", style: const TextStyle(fontSize: 16, color: Colors.grey)),
                      const Spacer(),
                      const Icon(Icons.star, color: Color(0xFFFFD700), size: 22),
                      Text(" ${place.rating}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),
                  const Text("About Destination", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  Text(
                    place.description,
                    style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _blurBtn(BuildContext context, {required IconData icon, required VoidCallback onTap, Color color = Colors.white}) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.2),
              child: Icon(icon, color: color, size: 24),
            ),
          ),
        ),
      ),
    );
  }
}