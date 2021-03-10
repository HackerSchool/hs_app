import '../lists/announcement_list.dart';

class MainPageInformation extends AnnouncementInformation {
  static final List<AnnouncementInformation> items = [
    AnnouncementInformation(
        title: 'HackDay',
        publication_date: '08/03/2021 \n 03:41pm',
        event_date: '13/03/2021',
        event_hour: '10:00am',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT01',
        explanation:
            'É suposto todos os grupos, e respectivos elementos, comparecerem! O evento é semanal e serve para a equipa reunir, trabalhar e avançar com o projeto. Nós iremos andar pelas salas a ver o que vocês andam a fazer e a ajudar no que for preciso'),
    AnnouncementInformation(
        title: 'Team Building',
        publication_date: '08/03/2021 \n 02:32am',
        event_date: '31/03/2021',
        event_hour: '03:00pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT02',
        explanation:
            'O evento serve para a malta se conhecer, trocar ideias, apresentar ideias para futuros projetos, etc e tal'),
    AnnouncementInformation(
        title: 'HackFeed',
        publication_date: '10/03/2021 \n 03:41am',
        event_date: '31/03/2021',
        event_hour: '09:00am',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT03',
        explanation:
            'Passará a ser uma vez por mês de modo a  progresso significativo para mostrar à nossa comunidade. Para incentivar o trabalho irá entrar em vigor um sistema de voto nestes dias onde sera(ão) escolhido(s) o(s) Projeto(s) do mês, e o projeto com mais votos no fim do semestre será o Projeto do Semestre! Tanto um como o outro vão trazer-vos exposição dentro e fora do núcleo, ficando highlighted no nosso website e sendo publicado nas nossas redes sociais!'),
    AnnouncementInformation(
        title: 'Sprint submition week 3',
        publication_date: '25/03/2021 \n 03:41am',
        event_date: '14/03/2021',
        event_hour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it'),
    AnnouncementInformation(
        title: 'Sprint submition week 2',
        publication_date: '25/03/2021 \n 03:25am',
        event_date: '14/03/2021',
        event_hour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it'),
    AnnouncementInformation(
        title: 'Gaming Night',
        publication_date: '14/03/2021 \n 03:55am',
        event_date: '15/03/2021',
        event_hour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it'),
    AnnouncementInformation(
        title: 'Cleaning Day',
        publication_date: '11/02/2021 \n 05:36pm',
        event_date: '16/03/2021',
        event_hour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it'),
  ];
  static AnnouncementInformation oneItem() {
    return items[0];
  }

  static List<AnnouncementInformation> allItems() {
    return items;
  }
}
