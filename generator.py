import argparse
import os
import random


def generate_predicate(genpred):
    arguments = genpred['args']
    predicate = '(' + genpred['name']
    for arg in range(arguments):
        predicate += ' ' + random.choice(genpred['types'][arg]['values'])
    return predicate + ')'


def generate_day_before(days):
    day_before = ''
    for i in range(len(days) - 1):
        day_before += 4 * ' ' + '(dayBefore ' + days[i] + ' ' + days[i + 1] + ')\n'
    return day_before + '\n'


def generate_classifications(main_courses, second_courses, categories):
    categories_mc = [5, 3, 6, 4, 6, 0, 1]
    categories_sc = [1, 1, 4, 0, 1, 1, 6]

    categorization = ''
    for index, course in enumerate(main_courses):
        categorization += 4 * ' ' + '(classified ' + course + ' ' + categories[categories_mc[index]] + ')\n'
    for index, course in enumerate(second_courses):
        categorization += 4 * ' ' + '(classified ' + course + ' ' + categories[categories_sc[index]] + ')\n'
    return categorization + '\n'


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Executes PDDL RicoRico versions')
    parser.add_argument('version', metavar='version', type=int, help='Version number')
    parser.add_argument('tests', metavar='tests', type=int, help='Number of tests')

    args = parser.parse_args()
    version = args.version
    n_tests = args.tests

    file_tpl = os.path.join('templates', 'problem.tpl')
    data = {
        'objects': [],
        'init': [],
        'goal': []
    }

    # Objects
    day = {
        'values': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
        'type': 'day'
    }
    data['objects'].append(day)

    main_course = {
        'values': ['Spaghetti_Bolognese', 'Mediterranean_Salad', 'Vegan_Sandwich', 'Mushroom_risotto',
                   'Guacamole_with_tomatoes', 'Sushi', 'American_burger'],
        'type': 'mainCourse'
    }
    data['objects'].append(main_course)

    second_course = {
        'values': ['Roast_pork_with_prunes', 'Spanish_omelette', 'Paella', 'Tuna_steak', 'Chicken_parmesan',
                   'Lamb_tagine', 'Couscous_meatloaf'],
        'type': 'secondCourse'
    }
    data['objects'].append(second_course)

    dish = {
        'values': main_course['values'] + second_course['values'],
        'type': 'dish'
    }

    # Init
    data['init'].append({'name': 'incompatible', 'random': True, 'args': 2, 'types': [main_course, second_course]})

    if version >= 1:
        pass

    if version >= 2:
        category = {
            'values': ['Fish', 'Meat', 'Soup', 'Salad', 'Rice', 'Pasta', 'Vegetables'],
            'type': 'category'
        }
        data['objects'].append(category)

        data['init'].append({'name': 'classified', 'random': False, 'values': generate_day_before(day['values'])})
        data['init'].append({'name': 'dayBefore', 'random': False, 'values': generate_classifications(
            main_course['values'],
            second_course['values'],
            category['values']
        )})

    if version >= 3:
        data['init'].append({'name': 'servedOnly', 'random': True, 'args': 2, 'types': [dish, day]})

    # Create objects
    objects = ''
    for obj in data['objects']:
        objects += 4 * ' ' + ' '.join(obj['values']) + ' - ' + obj['type'] + '\n'
    objects = objects[:-1]

    # Create init
    init = ''
    for pred in data['init']:
        if pred['random']:
            for _ in range(random.randint(1, 5)):
                init += 4 * ' ' + generate_predicate(pred) + '\n'
            init += '\n'
        else:
            init += pred['values']
    init = init[:-2]

    # Create goal
    goal = 4 * ' ' + '(forall (?d - day)\n' + 6 * ' ' + '(dayReady ?d)\n' + 4 * ' ' + ')'

    for n in range(n_tests):
        with open(file_tpl, 'r') as f:
            template = f.read()
            template = template.format(problem='ricoRico', domain='ricoRico', objects=objects, init=init, goal=goal)
            print(template)
