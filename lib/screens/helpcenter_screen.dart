import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [];
  TextEditingController textController = TextEditingController();

  void sendMessage() {
    String messageText = textController.text;
    if (messageText.isNotEmpty) {
      setState(() {
        Message message = Message(
          text: messageText,
          isMe: true,
        );
        messages.add(message);

        // Kondisi chat otomatis
        if (messageText.toLowerCase().contains('halo')) {
          Message autoReply = Message(
            text:
                'Halo! Ada yang bisa kami bantu? Ketik "menu" untuk menampilkan pilihan menu',
            isMe: false,
          );
          messages.add(autoReply);
        } else if (messageText.toLowerCase().contains('terima kasih')) {
          Message autoReply = Message(
            text: 'Terima Kasih telah menggunakan layanan kami. 🔥😊😇',
            isMe: false,
          );
          messages.add(autoReply);
        } else if (messageText.toLowerCase().contains('menu')) {
          Message autoReply = Message(
            text:
                'Berikut beberapa pilihan yang dapat Anda pilih: \n1. News \n2. Achivements \n3. Bagaimana melihat informasi akun \n4. Bagaimana melakukan akun baru  ',
            isMe: false,
          );
          messages.add(autoReply);
        } else if (messageText.toLowerCase().contains('1')) {
          Message autoReply = Message(
            text:
                'Halo member RRQ , untuk Informasi berita ! Silahkan periksa halaman homepage untuk memperoleh informasi terkini terkait RRQ (Rex Regum Qeon) News.',
            isMe: false,
          );
          messages.add(autoReply);
        } else if (messageText.toLowerCase().contains('2')) {
          Message autoReply = Message(
            text:
                'Halo member RRQ, untuk melihat informasi seputar achivement ! Silahkan periksa halaman achivement untuk memperoleh liputan achivement RRQ (Rex Regum Qeon).',
            isMe: false,
          );
          messages.add(autoReply);
        } else if (messageText.toLowerCase().contains('3')) {
          Message autoReply = Message(
            text:
                'Halo member RRQ, untuk melihat informasi pribadi ! Silahkan periksa halaman profile untuk memperoleh informasi terkini terkait data pribadi pada aplikasi RRQ (Rex Regum Qeon).',
            isMe: false,
          );
          messages.add(autoReply);
        } else if (messageText.toLowerCase().contains('4')) {
          Message autoReply = Message(
            text:
                'Halo member RRQ, untuk pembuatan akun baru pada aplikasi RRQ News ! Silahkan melakukan pendaftaran pada menu register yang dapat dilakukan pada tampilan awal RRQ News saat melakukan pendaftaran akun.',
            isMe: false,
          );
          messages.add(autoReply);
        } else if (messageText.toLowerCase().contains('pengembang aplikasi')) {
          Message autoReply = Message(
            text:
                '\n1. Fiky Ari Wijaya (Arriey) \n2. Bintang Indrawan (Azzuna) \n3. John Calvin (Azure)',
            isMe: false,
          );
          messages.add(autoReply);
        } else {
          Message autoReply = Message(
            text: 'Maaf, kami tidak dapat memahami pesan Anda.',
            isMe: false,
          );
          messages.add(autoReply);
        }

        textController.clear();
      });
    }
  }

  double calculateBorderSize(String messageText) {
    int characterCount = messageText.length;
    if (characterCount < 10) {
      return 2.0;
    } else if (characterCount >= 10 && characterCount < 20) {
      return 4.0;
    } else {
      return 6.0;
    }
  }

  Color getBorderColor(bool isMe) {
    return isMe ? Colors.orange : Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Help Center'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                Message message = messages[index];
                double borderSize = calculateBorderSize(message.text);
                Color borderColor = getBorderColor(message.isMe);
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: message.isMe
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          message.isMe ? Colors.orange : Colors.black,
                      child: Icon(
                        message.isMe ? Icons.person : Icons.business,
                        color: message.isMe
                            ? Color.fromARGB(255, 0, 0, 0)
                            : Colors.orange,
                      ),
                    ),
                    title: Text(
                      message.text,
                      style: TextStyle(
                        color: message.isMe ? Colors.white : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange,
                      width: 2.0,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.orange,
                    ),
                    onPressed: sendMessage,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
