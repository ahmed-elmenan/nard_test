final kOnboaridngInfo = [
  (
    assetName: "./assets/images/products_box.svg",
    text: "كل منتجات العالم في صندوق انبوكس",
  ),
  (
    assetName: "./assets/images/phone_hand.svg",
    text: "استقبال وارسال الشحنات في أي وقت مع انبوكس",
  ),
  (
    assetName: "./assets/images/security_man.svg",
    text: "في انبوكس الشحنات بأمان وحمایة عالیة جدا",
  )
];

({String action, String message}) kBuildMessage(bool isLogin) => isLogin
    ? (message: "Already have an account?", action: 'Login')
    : (message: "Don’t have an account?", action: 'Sign up');
