import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];
            return Padding(
              // Added Padding for vertical spacing between question blocks
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align items to the start of the row
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCorrect
                          ? const Color.fromARGB(255, 77, 179, 190)
                          : const Color.fromARGB(255, 210, 98, 232),
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 15, 15, 15)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      // Modified to use a Column to hold the question and answers
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the start
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 216, 206, 206),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                            height:
                                5), // Added spacing between question and answers
                        Text(
                          'Your Answer: ${data['user_answer']}',
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 200, 130, 214),
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Correct Answer: ${data['correct_answer']}',
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 77, 179, 190),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
