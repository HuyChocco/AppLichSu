class Question {
  final String id;
  final String sentence;
  final String idContent;
  final int number;
  List<String> options;
  final int answerIndex;

  Question(
      {this.id,
      this.sentence,
      this.idContent,
      this.number,
      this.options,
      this.answerIndex});
}

/* const List sample_data = [
  {
    "id": 1,
    "question": "Ngô Quyền lên ngôi vua, đóng đô ở đâu?",
    "options": ['Cổ Loa', 'Hoa Lư', 'Bạch Hạc', 'Phong Châu'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Vì sao Ngô Quyền không duy trì chính quyền của họ Khúc?",
    "options": [
      'Chính quyền họ Khúc về danh nghĩa vẫn thuộc nhà Đường',
      'Ngô Quyền muốn phát triển đất nước thành một Quốc gia độc lập, thiết lập một chính quyền hoàn toàn của người Việt',
      'Ngô Quyền muốn xây dựng một chính quyền cao hơn thời họ Khúc',
      'Ngô Quyền không muốn tự nhận mình là tiết độ sứ của chính quyền phương Bắc'
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question":
        "Việc làm nào của Ngô Quyền khẳng định chủ quyền quốc gia dân tộc?",
    "options": [
      'Đặt kinh đô ở Cổ Loa',
      'Đặt kinh đô ở Cổ Loa',
      'Đặt lại lễ nghi trong triều đình',
      'Đặt lại các chức quan trong triều đình, xóa bỏ các chức quan thời Bắc thuộc'
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Nguyên nhân chính dẫn đến nhà Ngô suy yếu?",
    "options": [
      'Quân Nam Hán xâm lược lần 2',
      'Chiến tranh nông dân nổ ra ở nhiều nơi',
      'Do mâu thuẫn nội bộ',
      'Các thế lực cát cứ nổ lên tranh giành quyền lực'
    ],
    "answer_index": 2,
  },
]; */
