import 'package:app2/features/search/manage/cubit/cubit/search_cubit.dart';
import 'package:app2/features/search/manage/models/searchmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                controller: _searchController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _performSearch(value);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchLoaded) {
                    return _buildSearchResults(state.data);
                  } else if (state is SearchError) {
                    return Center(
                      child: Text('Error: ${state.message}'),
                    );
                  } else {
                    return const Center(
                      child: Text('Enter a search term.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults(SearchModels data) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: data.data?.data.length ?? 0,
      itemBuilder: (context, index) {
        final datum = data.data?.data[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.all(20),
            title: Text(datum?.name ?? ''),
            subtitle: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                datum?.description ?? ''),
            leading: Image.network(datum?.image ?? ''),
          ),
        );
      },
    );
  }

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      context.read<SearchCubit>().search(query);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
