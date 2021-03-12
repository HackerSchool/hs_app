import '../lists/announcement_list.dart';

class MainPageInformation extends AnnouncementInformation {
  static final List<AnnouncementInformation> items = [
    AnnouncementInformation(
        title: 'HackDay',
        publicationDate: '08/03/2021 \n 03:41pm',
        eventDate: '13/03/2021',
        eventHour: '10:00am',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT01',
        explanation:
            'É suposto todos os grupos, e respectivos elementos, comparecerem! O evento é semanal e serve para a equipa reunir, trabalhar e avançar com o projeto. Nós iremos andar pelas salas a ver o que vocês andam a fazer e a ajudar no que for preciso.',
        iconLink:
            'https://cdn.my-mooc.com/media/cache/catalog_product_360x200/mooc/logo/582ff8757b39f240d621cc5bdc93d55760b7b5e0.jpg'),
    AnnouncementInformation(
        title: 'Team Building',
        publicationDate: '08/03/2021 \n 02:32am',
        eventDate: '31/03/2021',
        eventHour: '03:00pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT02',
        explanation:
            'O evento serve para a malta se conhecer, trocar ideias, apresentar ideias para futuros projetos, etc e tal.',
        iconLink:
            'https://cdn.my-mooc.com/media/cache/catalog_product_360x200/mooc/logo/582ff8757b39f240d621cc5bdc93d55760b7b5e0.jpg'),
    AnnouncementInformation(
        title: 'HackFeed',
        publicationDate: '10/03/2021 \n 03:41am',
        eventDate: '31/03/2021',
        eventHour: '09:00am',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT03',
        explanation:
            'Passará a ser uma vez por mês de modo a  progresso significativo para mostrar à nossa comunidade. Para incentivar o trabalho irá entrar em vigor um sistema de voto nestes dias onde sera(ão) escolhido(s) o(s) Projeto(s) do mês, e o projeto com mais votos no fim do semestre será o Projeto do Semestre! Tanto um como o outro vão trazer-vos exposição dentro e fora do núcleo, ficando highlighted no nosso website e sendo publicado nas nossas redes sociais!',
        iconLink:
            'https://cdn.my-mooc.com/media/cache/catalog_product_360x200/mooc/logo/582ff8757b39f240d621cc5bdc93d55760b7b5e0.jpg'),
    AnnouncementInformation(
        title: 'Sprint submition7890',
        publicationDate: '25/03/2021 \n 03:41am',
        eventDate: '14/03/2021',
        eventHour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it.',
        iconLink:
            'https://cdn.my-mooc.com/media/cache/catalog_product_360x200/mooc/logo/582ff8757b39f240d621cc5bdc93d55760b7b5e0.jpg'),
    AnnouncementInformation(
        title: 'Sprint submition week 2',
        publicationDate: '25/03/2021 \n 03:25am',
        eventDate: '14/03/2021',
        eventHour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it.',
        iconLink:
            'https://cdn.my-mooc.com/media/cache/catalog_product_360x200/mooc/logo/582ff8757b39f240d621cc5bdc93d55760b7b5e0.jpg'),
    AnnouncementInformation(
        title: 'Gaming Night',
        publicationDate: '14/03/2021 \n 03:55am',
        eventDate: '15/03/2021',
        eventHour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it.',
        iconLink:
            'https://media.istockphoto.com/vectors/gamepad-neon-banner-vector-id1097324616?k=6&m=1097324616&s=612x612&w=0&h=7f96z5twUi6f_RVCO5TwfWHcsXIhL3uII8v4kQlkhR0='),
    AnnouncementInformation(
        title: 'Cleaning Day',
        publicationDate: '11/02/2021 \n 05:36pm',
        eventDate: '16/03/2021',
        eventHour: '11:59pm',
        links:
            'https://zoom.us/j/99031315527?pwd=Rnk1T294M0JJV01KRVV4Y0dxdE16UT04',
        explanation:
            'Hey guys! Everyone have to submit the sprints of this week until tomorrow. Its important that EVERYONE does it.',
        iconLink:
            'https://cdn.my-mooc.com/media/cache/catalog_product_360x200/mooc/logo/582ff8757b39f240d621cc5bdc93d55760b7b5e0.jpg'),
  ];
  static AnnouncementInformation oneItem() {
    return items[0];
  }

  static List<AnnouncementInformation> allItems() {
    return items;
  }
}
