// lib/models/milestone.dart

// (Keep the updated Milestone class from Step 1)
class Milestone {
  final int day;
  final String title;
  final String body;
  final String mind;
  final String icon; // This should now be a String

  Milestone({
    this.day = 0,
    required this.title,
    required this.body,
    required this.mind,
    required this.icon,
  });
}

// --- NEW LIST USING YOUR SVG ICONS ---
final allMilestones = [
  Milestone(
    day: 1,
    title: "Day 1: The First Step",
    body:
        "Your insulin levels are starting to stabilize. Your liver is getting a much-needed break from processing fructose, beginning the transition to fat-burning.",
    mind:
        "The first psychological hurdle. You've made a conscious decision and stuck with it. Well done.",
    icon: 'assets/icons/shutdown.svg',
  ),
  Milestone(
    day: 2,
    title: "Day 2: The Cleanse",
    body:
        "You might feel a bit foggy or have a headache. This is a positive sign! It's your body recalibrating its hormonal and metabolic systems. It's a true detox.",
    mind:
        "This is often the toughest day for cravings as your brain's reward system screams for a fix. Acknowledge the feeling and let it pass. It's temporary.",
    icon: 'assets/icons/clean.svg',
  ),
  Milestone(
    day: 3,
    title: "Day 3: Peak Challenge",
    body:
        "Your dopamine pathways are starting to reset. Your body is becoming more 'insulin-sensitive,' which is fantastic for your long-term health.",
    mind:
        "You've made it through the hardest part of the initial withdrawal. From here, the physical cravings will start to subside.",
    icon: 'assets/icons/peak.svg',
  ),
  Milestone(
    day: 5,
    title: "Day 5: Gut Guardian",
    body:
        "The 'bad' bacteria in your gut that thrive on sugar are starting to die off. This makes room for beneficial bacteria to flourish, improving digestion and overall gut health.",
    mind:
        "You're noticing a pattern and proving to yourself that you don't need sugar to get through the day.",
    icon: 'assets/icons/microorganisms.svg',
  ),
  Milestone(
    day: 7,
    title: "Day 7: The Taste Bud Reset",
    body:
        "Your taste buds are no longer desensitized by overwhelming sweetness. An apple or a strawberry will start to taste incredibly sweet and flavorful.",
    mind:
        "A major milestone! You've completed a full week. The habit is beginning to form.",
    icon: 'assets/icons/taste.svg',
  ),
  Milestone(
    day: 14,
    title: "Day 14: The Glow Up",
    body:
        "Sugar damages collagen. By cutting it out, you're stopping this damage. Reduced inflammation can lead to clearer, calmer skin.",
    mind:
        "Two weeks! Your commitment is solidifying. This is no longer a fluke; it's a lifestyle change.",
    icon: 'assets/icons/glowup.svg',
  ),
  Milestone(
    day: 21,
    title: "Day 21: The Habit Loop",
    body:
        "Your brain has had enough time to start forming new neural pathways. Reaching for a healthy snack instead of a sugary one feels more natural.",
    mind:
        "They say it takes 21 days to form a habit. You've just laid the foundation for a permanent, positive change.",
    icon: 'assets/icons/infinity.svg',
  ),
  Milestone(
    day: 30,
    title: "Day 30: The Energy Upgrade",
    body:
        "Your body is now efficient at using fat for fuel, leading to more stable energy without the afternoon crashes. Your triglyceride levels have likely dropped significantly.",
    mind:
        "You've conquered a whole month. Your self-efficacy is sky-high. You are in control.",
    icon: 'assets/icons/lightning.svg',
  ),
  Milestone(
    day: 40,
    title: "Day 40: The Dental Dividend",
    body:
        "The harmful bacteria in your mouth that cause cavities thrive on sugar. By starving them, you're dramatically improving your oral health and reducing inflammation in your gums.",
    mind:
        "Your mouth feels cleaner, and you're investing in a future with fewer dental bills. That's a reason to smile.",
    icon: 'assets/icons/dental.svg',
  ),
  Milestone(
    day: 60,
    title: "Day 60: Deeper Sleep",
    body:
        "Without blood sugar spikes and crashes disrupting your night, your body can achieve deeper, more restorative sleep cycles. This improves everything from memory to mood.",
    mind:
        "Waking up feeling genuinely rested becomes the new normal, not the exception.",
    icon: 'assets/icons/sleeping.svg',
  ),
  Milestone(
    day: 75,
    title: "Day 75: Autophagy Activated",
    body:
        "With lower insulin levels, your body's cellular cleanup process, known as 'autophagy,' can work more effectively. It's like a deep spring-cleaning for your cells, removing damaged parts.",
    mind:
        "You're not just looking better, you are fundamentally healthier on a cellular level. This is deep healing.",
    icon: 'assets/icons/recycle.svg',
  ),
  Milestone(
    day: 90,
    title: "Day 90: Mental Sharpness",
    body:
        "Reduced inflammation in the brain and stable energy supply leads to less 'brain fog,' better focus, and improved memory recall.",
    mind:
        "You feel sharper and more clear-headed. Complex tasks seem less daunting.",
    icon: 'assets/icons/mental.svg',
  ),
  Milestone(
    day: 120,
    title: "4 Months: The Immune Boost",
    body:
        "High sugar intake can impair the function of your white blood cells. After four months, your immune system is operating without this handicap, better equipped to fight off infections.",
    mind:
        "You're building a more resilient body, one that's better prepared to defend itself.",
    icon: 'assets/icons/gardian.svg',
  ),
  Milestone(
    day: 150,
    title: "5 Months: The Stress Shield",
    body:
        "The cortisol rollercoaster caused by blood sugar swings is a thing of the past. Your body's stress-response system is calmer and more regulated, improving your mood and resilience.",
    mind:
        "You may find you're less reactive to daily stressors. You have more emotional bandwidth.",
    icon: 'assets/icons/peace_pigeon.svg',
  ),
  Milestone(
    day: 180,
    title: "6 Months: Healthy Heart",
    body:
        "Significant improvements in cardiovascular risk factors, including blood pressure, cholesterol levels (lower LDL, higher HDL), and triglycerides.",
    mind:
        "You've actively and dramatically reduced your risk for future health problems. This is a huge win.",
    icon: 'assets/icons/heart_with_pulse.svg',
  ),
  Milestone(
    day: 240,
    title: "8 Months: Slowing the Clock",
    body:
        "You've drastically reduced the formation of 'AGEs' (Advanced Glycation End-products) in your body. These compounds stiffen tissues and accelerate aging, so you're protecting your skin, organs, and joints.",
    mind:
        "This is a long-term investment in your future self. You're not just healthier now; you're setting the stage for more graceful aging.",
    icon: 'assets/icons/delivery_time.svg',
  ),
  Milestone(
    day: 300,
    title: "Day 300: The Milestone Master",
    body:
        "This achievement isn't about a new biological process; it's about acknowledging your incredible consistency. 300 days is a monumental display of discipline and commitment.",
    mind:
        "This is no longer a challenge; it's a core part of who you are. You are someone who prioritizes their health, and you've proven it 300 times over.",
    icon: 'assets/icons/warranty.svg',
  ),
  Milestone(
    day: 365,
    title: "1 Year: A New Baseline",
    body:
        "You've rewired your metabolism and significantly lowered your risk for Type 2 diabetes and other chronic illnesses. Your body has established a new, healthier normal.",
    mind:
        "This is no longer something you 'do'; it's your identity. Celebrate this incredible achievement and the person you've become.",
    icon: 'assets/icons/prize.svg',
  ),
];
