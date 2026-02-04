import 'package:flutter/material.dart';

const Color appBlue = Color(0xFF5479F7);
const Color chatBg = Color(0xFFCADDFF);

const Color darkBg = Color(0xFF0F0F0F);
const Color darkSurface = Color(0xFF1A1A1A);
const Color darkBorder = Color(0xFF2A2A2A);

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: chatBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16), // 👈 keeps UI off screen edges
          child: Row(
            children: [
              if (isDesktop) const ChatSidebar(),
              const SizedBox(width: 16),
              const Expanded(child: ChatArea()),
            ],
          ),
        ),
      ),
    );
  }
}

/* ===================== SIDEBAR ===================== */

class ChatSidebar extends StatelessWidget {
  const ChatSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: darkBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "SAMPATTI AI",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 30),

          const SidebarItem(icon: Icons.add, label: "New Chat"),
          const SidebarItem(icon: Icons.history, label: "Chat History"),
          const SidebarItem(icon: Icons.settings, label: "Settings"),

          const Spacer(),

          const Divider(color: darkBorder),
          const SizedBox(height: 12),

          const Text(
            "Logged in as\nUser",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Times New Roman',
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: appBlue, size: 20),
          const SizedBox(width: 14),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Times New Roman',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== CHAT AREA ===================== */

class ChatArea extends StatelessWidget {
  const ChatArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: chatBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: const [
          ChatHeader(),
          Expanded(child: ChatMessages()),
          ChatInput(),
        ],
      ),
    );
  }
}

/* ===================== HEADER ===================== */

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: darkBorder)),
      ),
      child: Row(
        children: const [
          Icon(Icons.smart_toy, color: appBlue),
          SizedBox(width: 12),
          Text(
            "Sampatti Virtual Assistant",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== MESSAGES ===================== */

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        AIMessage(
          text:
              "Hello 👋 I’m your insurance assistant. How can I help you today?",
        ),
        UserMessage(
          text: "I want to understand health insurance.",
        ),
        AIMessage(
          text:
              "Sure! Health insurance helps cover hospital bills, medicines, and treatment costs so your finances stay protected.",
        ),
      ],
    );
  }
}

class AIMessage extends StatelessWidget {
  final String text;
  const AIMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 620),
        decoration: BoxDecoration(
          color: darkSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Times New Roman',
            color: Colors.white,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  final String text;
  const UserMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 620),
        decoration: BoxDecoration(
          color: appBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Times New Roman',
            color: Colors.white,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

/* ===================== INPUT ===================== */

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: darkBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Times New Roman',
              ),
              decoration: InputDecoration(
                hintText: "Type your message...",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: darkSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: appBlue,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
