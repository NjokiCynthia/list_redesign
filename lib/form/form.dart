import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_redesign/form/cubit/post_shoe_cubit.dart';
import 'package:list_redesign/models/_index.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void initState() {
    super.initState();

    context.read<PostShoeCubit>().loadFormPage();
  }

  @override
  Widget build(BuildContext context) {
    final postShoeCubit = BlocProvider.of<PostShoeCubit>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Speak to us'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<PostShoeCubit, PostShoeState>(
            builder: (BuildContext context, PostShoeState state) {
              return state.when(
                initial: () => _buildForm(context, postShoeCubit),
                sending: () => const CircularProgressIndicator(),
                sent: (shoes) => const Text('Successfully sent'),
                error: Text.new,
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildForm(BuildContext pageContext, PostShoeCubit postShoeCubit) {
  return FormWidget(
    pageContext: pageContext,
    postShoeCubit: postShoeCubit,
  );
}

class FormWidget extends StatefulWidget {
  const FormWidget({
    Key? key,
    required this.pageContext,
    required this.postShoeCubit,
  }) : super(key: key);
  final BuildContext pageContext;
  final PostShoeCubit postShoeCubit;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    // Text fields
    var name = '';
    var slug = '';

    return SizedBox(
      width: MediaQuery.of(widget.pageContext).size.width * .7,
      height: MediaQuery.of(widget.pageContext).size.height * .7,
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(hintText: 'Shoe Name'),
              validator: (value) => value!.isEmpty ? 'Enter the shoe name' : null,
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
            TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(hintText: 'the slug'),
              validator: (value) => value!.isEmpty ? 'Enter' : null,
              keyboardType: TextInputType.number,
              onChanged: (val) {
                slug = val;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  widget.postShoeCubit.postShoes(
                    ListItemDTO(
                      name: name,
                      slug: slug,
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}