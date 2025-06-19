import 'dart:convert';

class Rates {
	int? usd;
	double? aed;
	double? afn;
	double? all;
	double? amd;
	double? ang;
	double? aoa;
	double? ars;
	double? aud;
	double? awg;
	double? azn;
	double? bam;
	int? bbd;
	double? bdt;
	double? bgn;
	double? bhd;
	double? bif;
	int? bmd;
	double? bnd;
	double? bob;
	double? brl;
	int? bsd;
	double? btn;
	double? bwp;
	double? byn;
	int? bzd;
	double? cad;
	double? cdf;
	double? chf;
	double? clp;
	double? cny;
	double? cop;
	double? crc;
	int? cup;
	double? cve;
	double? czk;
	double? djf;
	double? dkk;
	double? dop;
	double? dzd;
	double? egp;
	int? ern;
	double? etb;
	double? eur;
	double? fjd;
	double? fkp;
	double? fok;
	double? gbp;
	double? gel;
	double? ggp;
	double? ghs;
	double? gip;
	double? gmd;
	double? gnf;
	double? gtq;
	double? gyd;
	double? hkd;
	double? hnl;
	double? hrk;
	double? htg;
	double? huf;
	double? idr;
	double? ils;
	double? imp;
	double? inr;
	double? iqd;
	double? irr;
	double? isk;
	double? jep;
	double? jmd;
	double? jod;
	double? jpy;
	double? kes;
	double? kgs;
	double? khr;
	double? kid;
	double? kmf;
	double? krw;
	double? kwd;
	double? kyd;
	double? kzt;
	double? lak;
	int? lbp;
	double? lkr;
	double? lrd;
	double? lsl;
	double? lyd;
	double? mad;
	double? mdl;
	double? mga;
	double? mkd;
	double? mmk;
	double? mnt;
	double? mop;
	double? mru;
	double? mur;
	double? mvr;
	double? mwk;
	double? mxn;
	double? myr;
	double? mzn;
	double? nad;
	double? ngn;
	double? nio;
	double? nok;
	double? npr;
	double? nzd;
	double? omr;
	int? pab;
	double? pen;
	double? pgk;
	double? php;
	double? pkr;
	double? pln;
	double? pyg;
	double? qar;
	double? ron;
	double? rsd;
	double? rub;
	double? rwf;
	double? sar;
	double? sbd;
	double? scr;
	double? sdg;
	double? sek;
	double? sgd;
	double? shp;
	double? sle;
	double? sll;
	double? sos;
	double? srd;
	double? ssp;
	double? stn;
	double? syp;
	double? szl;
	double? thb;
	double? tjs;
	double? tmt;
	double? tnd;
	double? top;

	double? ttd;
	double? tvd;
	double? twd;
	double? tzs;
	double? uah;
	double? ugx;
	double? uyu;
	double? uzs;
	double? ves;
	double? vnd;
	double? vuv;
	double? wst;
	double? xaf;
	double? xcd;
	double? xcg;
	double? xdr;
	double? xof;
	double? xpf;
	double? yer;
	double? zar;
	double? zmw;
	double? zwl;
  double? operator [](String code) {
    switch (code.toUpperCase()) {
      case 'USD':
        return usd!.toDouble();
      case 'EUR':
        return eur;
      case 'GBP':
        return gbp;
      case 'AED':
        return aed;
        case'SAR':
        return sar;
        case "SYP":
        return syp;

      default:
        return null;
    }
  }

    // 'USD',
    //   'EUR',
    //   'GBP',
    //   'AED',
    //   'SAR',
    //   'JPY',

	Rates({
		this.usd, 
		this.aed, 
		this.afn, 
		this.all, 
		this.amd, 
		this.ang, 
		this.aoa, 
		this.ars, 
		this.aud, 
		this.awg, 
		this.azn, 
		this.bam, 
		this.bbd, 
		this.bdt, 
		this.bgn, 
		this.bhd, 
		this.bif, 
		this.bmd, 
		this.bnd, 
		this.bob, 
		this.brl, 
		this.bsd, 
		this.btn, 
		this.bwp, 
		this.byn, 
		this.bzd, 
		this.cad, 
		this.cdf, 
		this.chf, 
		this.clp, 
		this.cny, 
		this.cop, 
		this.crc, 
		this.cup, 
		this.cve, 
		this.czk, 
		this.djf, 
		this.dkk, 
		this.dop, 
		this.dzd, 
		this.egp, 
		this.ern, 
		this.etb, 
		this.eur, 
		this.fjd, 
		this.fkp, 
		this.fok, 
		this.gbp, 
		this.gel, 
		this.ggp, 
		this.ghs, 
		this.gip, 
		this.gmd, 
		this.gnf, 
		this.gtq, 
		this.gyd, 
		this.hkd, 
		this.hnl, 
		this.hrk, 
		this.htg, 
		this.huf, 
		this.idr, 
		this.ils, 
		this.imp, 
		this.inr, 
		this.iqd, 
		this.irr, 
		this.isk, 
		this.jep, 
		this.jmd, 
		this.jod, 
		this.jpy, 
		this.kes, 
		this.kgs, 
		this.khr, 
		this.kid, 
		this.kmf, 
		this.krw, 
		this.kwd, 
		this.kyd, 
		this.kzt, 
		this.lak, 
		this.lbp, 
		this.lkr, 
		this.lrd, 
		this.lsl, 
		this.lyd, 
		this.mad, 
		this.mdl, 
		this.mga, 
		this.mkd, 
		this.mmk, 
		this.mnt, 
		this.mop, 
		this.mru, 
		this.mur, 
		this.mvr, 
		this.mwk, 
		this.mxn, 
		this.myr, 
		this.mzn, 
		this.nad, 
		this.ngn, 
		this.nio, 
		this.nok, 
		this.npr, 
		this.nzd, 
		this.omr, 
		this.pab, 
		this.pen, 
		this.pgk, 
		this.php, 
		this.pkr, 
		this.pln, 
		this.pyg, 
		this.qar, 
		this.ron, 
		this.rsd, 
		this.rub, 
		this.rwf, 
		this.sar, 
		this.sbd, 
		this.scr, 
		this.sdg, 
		this.sek, 
		this.sgd, 
		this.shp, 
		this.sle, 
		this.sll, 
		this.sos, 
		this.srd, 
		this.ssp, 
		this.stn, 
		this.syp, 
		this.szl, 
		this.thb, 
		this.tjs, 
		this.tmt, 
		this.tnd, 
		this.top, 

		this.ttd, 
		this.tvd, 
		this.twd, 
		this.tzs, 
		this.uah, 
		this.ugx, 
		this.uyu, 
		this.uzs, 
		this.ves, 
		this.vnd, 
		this.vuv, 
		this.wst, 
		this.xaf, 
		this.xcd, 
		this.xcg, 
		this.xdr, 
		this.xof, 
		this.xpf, 
		this.yer, 
		this.zar, 
		this.zmw, 
		this.zwl, 
	});

	factory Rates.fromResultSuccessProviderHttpsWwwExchangerateApiComDocumentationHttpsWwwExchangerateApiComDocsFreeTermsOfUseHttpsWwwExchangerateApiComTermsTimeLastUpdateUnix1749081751TimeLastUpdateUtcThu05Jun20250002310000TimeNextUpdateUnix1749168621TimeNextUpdateUtcFri06Jun20250010210000TimeEolUnix0BaseCodeUsdRatesUsd1Aed36725Afn69563131All86259086Amd383969208Ang179Aoa917849558Ars118433Aud1540763Awg179Azn1700083Bam1713923Bbd2Bdt122163894Bgn1714369Bhd0376Bif297617376Bmd1Bnd1286981Bob6927421Brl5635854Bsd1Btn85901818Bwp13409475Byn3272455Bzd2Cad1368332Cdf289088027Chf0819649Clp940506035Cny7182925Cop4103044505Crc508445534Cup24Cve96626874Czk21760166Djf177721Dkk6535347Dop59040358Dzd131670115Egp49652593Ern15Etb134694232Eur0876353Fjd2253649Fkp0738027Fok6535419Gbp0738056Gel2731085Ggp0738027Ghs10327023Gip0738027Gmd72691587Gnf8692583678Gtq7682957Gyd209193253Hkd7846007Hnl26048538Hrk6602595Htg130850941Huf353691575Idr16298441224Ils3490546Imp0738027Inr85901875Iqd1309755574Irr42115403271Isk126967497Jep0738027Jmd159556744Jod0709Jpy143095858Kes129209976Kgs87526541Khr4017643761Kid1540706Kmf43111872Krw1365045979Kwd0306446Kyd0833333Kzt510049325Lak21654678338Lbp89500Lkr299333034Lrd199640725Lsl17823672Lyd5450968Mad9178885Mdl17255168Mga4545388597Mkd5391438Mmk2099190991Mnt358471567Mop8081387Mru39744846Mur45651131Mvr1545626Mwk1738690354Mxn19199799Myr4246963Mzn63856084Nad17823672Ngn1579229001Nio36789574Nok10105458Npr13744291Nzd165986Omr0384497Pab1Pen3622811Pgk4163544Php55762658Pkr282661141Pln3751502Pyg8007973589Qar364Ron4437204Rsd102963621Rub78988168Rwf1440611879Sar375Sbd8553198Scr14613387Sdg54402363Sek9584619Sgd1287008Shp0738027Sle22710139Sll22710138702Sos571544887Srd36793337Ssp4576879113Stn21469718Syp12934116311Szl17823672Thb3263832Tjs9983808Tmt3499596Tnd2952136Top2358362Try39226074Ttd6777637Tvd1540706Twd29885239Tzs2674129453Uah41498185Ugx3642222558Uyu41698493Uzs12850183359Ves979031Vnd26080861932Vuv12023561Wst2752197Xaf57482496Xcd27Xcg179Xdr0736059Xof57482496Xpf104572422Yer243474557Zar17822992Zmw263817Zwl69312(Map<String, dynamic> data) {
		return Rates(
			usd: data['USD'] as int?,
			aed: (data['AED'] as num?)?.toDouble(),
			afn: (data['AFN'] as num?)?.toDouble(),
			all: (data['ALL'] as num?)?.toDouble(),
			amd: (data['AMD'] as num?)?.toDouble(),
			ang: (data['ANG'] as num?)?.toDouble(),
			aoa: (data['AOA'] as num?)?.toDouble(),
			ars: (data['ARS'] as num?)?.toDouble(),
			aud: (data['AUD'] as num?)?.toDouble(),
			awg: (data['AWG'] as num?)?.toDouble(),
			azn: (data['AZN'] as num?)?.toDouble(),
			bam: (data['BAM'] as num?)?.toDouble(),
			bbd: data['BBD'] as int?,
			bdt: (data['BDT'] as num?)?.toDouble(),
			bgn: (data['BGN'] as num?)?.toDouble(),
			bhd: (data['BHD'] as num?)?.toDouble(),
			bif: (data['BIF'] as num?)?.toDouble(),
			bmd: data['BMD'] as int?,
			bnd: (data['BND'] as num?)?.toDouble(),
			bob: (data['BOB'] as num?)?.toDouble(),
			brl: (data['BRL'] as num?)?.toDouble(),
			bsd: data['BSD'] as int?,
			btn: (data['BTN'] as num?)?.toDouble(),
			bwp: (data['BWP'] as num?)?.toDouble(),
			byn: (data['BYN'] as num?)?.toDouble(),
			bzd: data['BZD'] as int?,
			cad: (data['CAD'] as num?)?.toDouble(),
			cdf: (data['CDF'] as num?)?.toDouble(),
			chf: (data['CHF'] as num?)?.toDouble(),
			clp: (data['CLP'] as num?)?.toDouble(),
			cny: (data['CNY'] as num?)?.toDouble(),
			cop: (data['COP'] as num?)?.toDouble(),
			crc: (data['CRC'] as num?)?.toDouble(),
			cup: data['CUP'] as int?,
			cve: (data['CVE'] as num?)?.toDouble(),
			czk: (data['CZK'] as num?)?.toDouble(),
			djf: (data['DJF'] as num?)?.toDouble(),
			dkk: (data['DKK'] as num?)?.toDouble(),
			dop: (data['DOP'] as num?)?.toDouble(),
			dzd: (data['DZD'] as num?)?.toDouble(),
			egp: (data['EGP'] as num?)?.toDouble(),
			ern: data['ERN'] as int?,
			etb: (data['ETB'] as num?)?.toDouble(),
			eur: (data['EUR'] as num?)?.toDouble(),
			fjd: (data['FJD'] as num?)?.toDouble(),
			fkp: (data['FKP'] as num?)?.toDouble(),
			fok: (data['FOK'] as num?)?.toDouble(),
			gbp: (data['GBP'] as num?)?.toDouble(),
			gel: (data['GEL'] as num?)?.toDouble(),
			ggp: (data['GGP'] as num?)?.toDouble(),
			ghs: (data['GHS'] as num?)?.toDouble(),
			gip: (data['GIP'] as num?)?.toDouble(),
			gmd: (data['GMD'] as num?)?.toDouble(),
			gnf: (data['GNF'] as num?)?.toDouble(),
			gtq: (data['GTQ'] as num?)?.toDouble(),
			gyd: (data['GYD'] as num?)?.toDouble(),
			hkd: (data['HKD'] as num?)?.toDouble(),
			hnl: (data['HNL'] as num?)?.toDouble(),
			hrk: (data['HRK'] as num?)?.toDouble(),
			htg: (data['HTG'] as num?)?.toDouble(),
			huf: (data['HUF'] as num?)?.toDouble(),
			idr: (data['IDR'] as num?)?.toDouble(),
			ils: (data['ILS'] as num?)?.toDouble(),
			imp: (data['IMP'] as num?)?.toDouble(),
			inr: (data['INR'] as num?)?.toDouble(),
			iqd: (data['IQD'] as num?)?.toDouble(),
			irr: (data['IRR'] as num?)?.toDouble(),
			isk: (data['ISK'] as num?)?.toDouble(),
			jep: (data['JEP'] as num?)?.toDouble(),
			jmd: (data['JMD'] as num?)?.toDouble(),
			jod: (data['JOD'] as num?)?.toDouble(),
			jpy: (data['JPY'] as num?)?.toDouble(),
			kes: (data['KES'] as num?)?.toDouble(),
			kgs: (data['KGS'] as num?)?.toDouble(),
			khr: (data['KHR'] as num?)?.toDouble(),
			kid: (data['KID'] as num?)?.toDouble(),
			kmf: (data['KMF'] as num?)?.toDouble(),
			krw: (data['KRW'] as num?)?.toDouble(),
			kwd: (data['KWD'] as num?)?.toDouble(),
			kyd: (data['KYD'] as num?)?.toDouble(),
			kzt: (data['KZT'] as num?)?.toDouble(),
			lak: (data['LAK'] as num?)?.toDouble(),
			lbp: data['LBP'] as int?,
			lkr: (data['LKR'] as num?)?.toDouble(),
			lrd: (data['LRD'] as num?)?.toDouble(),
			lsl: (data['LSL'] as num?)?.toDouble(),
			lyd: (data['LYD'] as num?)?.toDouble(),
			mad: (data['MAD'] as num?)?.toDouble(),
			mdl: (data['MDL'] as num?)?.toDouble(),
			mga: (data['MGA'] as num?)?.toDouble(),
			mkd: (data['MKD'] as num?)?.toDouble(),
			mmk: (data['MMK'] as num?)?.toDouble(),
			mnt: (data['MNT'] as num?)?.toDouble(),
			mop: (data['MOP'] as num?)?.toDouble(),
			mru: (data['MRU'] as num?)?.toDouble(),
			mur: (data['MUR'] as num?)?.toDouble(),
			mvr: (data['MVR'] as num?)?.toDouble(),
			mwk: (data['MWK'] as num?)?.toDouble(),
			mxn: (data['MXN'] as num?)?.toDouble(),
			myr: (data['MYR'] as num?)?.toDouble(),
			mzn: (data['MZN'] as num?)?.toDouble(),
			nad: (data['NAD'] as num?)?.toDouble(),
			ngn: (data['NGN'] as num?)?.toDouble(),
			nio: (data['NIO'] as num?)?.toDouble(),
			nok: (data['NOK'] as num?)?.toDouble(),
			npr: (data['NPR'] as num?)?.toDouble(),
			nzd: (data['NZD'] as num?)?.toDouble(),
			omr: (data['OMR'] as num?)?.toDouble(),
			pab: data['PAB'] as int?,
			pen: (data['PEN'] as num?)?.toDouble(),
			pgk: (data['PGK'] as num?)?.toDouble(),
			php: (data['PHP'] as num?)?.toDouble(),
			pkr: (data['PKR'] as num?)?.toDouble(),
			pln: (data['PLN'] as num?)?.toDouble(),
			pyg: (data['PYG'] as num?)?.toDouble(),
			qar: (data['QAR'] as num?)?.toDouble(),
			ron: (data['RON'] as num?)?.toDouble(),
			rsd: (data['RSD'] as num?)?.toDouble(),
			rub: (data['RUB'] as num?)?.toDouble(),
			rwf: (data['RWF'] as num?)?.toDouble(),
			sar: (data['SAR'] as num?)?.toDouble(),
			sbd: (data['SBD'] as num?)?.toDouble(),
			scr: (data['SCR'] as num?)?.toDouble(),
			sdg: (data['SDG'] as num?)?.toDouble(),
			sek: (data['SEK'] as num?)?.toDouble(),
			sgd: (data['SGD'] as num?)?.toDouble(),
			shp: (data['SHP'] as num?)?.toDouble(),
			sle: (data['SLE'] as num?)?.toDouble(),
			sll: (data['SLL'] as num?)?.toDouble(),
			sos: (data['SOS'] as num?)?.toDouble(),
			srd: (data['SRD'] as num?)?.toDouble(),
			ssp: (data['SSP'] as num?)?.toDouble(),
			stn: (data['STN'] as num?)?.toDouble(),
			syp: (data['SYP'] as num?)?.toDouble(),
			szl: (data['SZL'] as num?)?.toDouble(),
			thb: (data['THB'] as num?)?.toDouble(),
			tjs: (data['TJS'] as num?)?.toDouble(),
			tmt: (data['TMT'] as num?)?.toDouble(),
			tnd: (data['TND'] as num?)?.toDouble(),
			top: (data['TOP'] as num?)?.toDouble(),

			ttd: (data['TTD'] as num?)?.toDouble(),
			tvd: (data['TVD'] as num?)?.toDouble(),
			twd: (data['TWD'] as num?)?.toDouble(),
			tzs: (data['TZS'] as num?)?.toDouble(),
			uah: (data['UAH'] as num?)?.toDouble(),
			ugx: (data['UGX'] as num?)?.toDouble(),
			uyu: (data['UYU'] as num?)?.toDouble(),
			uzs: (data['UZS'] as num?)?.toDouble(),
			ves: (data['VES'] as num?)?.toDouble(),
			vnd: (data['VND'] as num?)?.toDouble(),
			vuv: (data['VUV'] as num?)?.toDouble(),
			wst: (data['WST'] as num?)?.toDouble(),
			xaf: (data['XAF'] as num?)?.toDouble(),
			xcd: (data['XCD'] as num?)?.toDouble(),
			xcg: (data['XCG'] as num?)?.toDouble(),
			xdr: (data['XDR'] as num?)?.toDouble(),
			xof: (data['XOF'] as num?)?.toDouble(),
			xpf: (data['XPF'] as num?)?.toDouble(),
			yer: (data['YER'] as num?)?.toDouble(),
			zar: (data['ZAR'] as num?)?.toDouble(),
			zmw: (data['ZMW'] as num?)?.toDouble(),
			zwl: (data['ZWL'] as num?)?.toDouble(),
		);
	}



	Map<String, dynamic> toResultSuccessProviderHttpsWwwExchangerateApiComDocumentationHttpsWwwExchangerateApiComDocsFreeTermsOfUseHttpsWwwExchangerateApiComTermsTimeLastUpdateUnix1749081751TimeLastUpdateUtcThu05Jun20250002310000TimeNextUpdateUnix1749168621TimeNextUpdateUtcFri06Jun20250010210000TimeEolUnix0BaseCodeUsdRatesUsd1Aed36725Afn69563131All86259086Amd383969208Ang179Aoa917849558Ars118433Aud1540763Awg179Azn1700083Bam1713923Bbd2Bdt122163894Bgn1714369Bhd0376Bif297617376Bmd1Bnd1286981Bob6927421Brl5635854Bsd1Btn85901818Bwp13409475Byn3272455Bzd2Cad1368332Cdf289088027Chf0819649Clp940506035Cny7182925Cop4103044505Crc508445534Cup24Cve96626874Czk21760166Djf177721Dkk6535347Dop59040358Dzd131670115Egp49652593Ern15Etb134694232Eur0876353Fjd2253649Fkp0738027Fok6535419Gbp0738056Gel2731085Ggp0738027Ghs10327023Gip0738027Gmd72691587Gnf8692583678Gtq7682957Gyd209193253Hkd7846007Hnl26048538Hrk6602595Htg130850941Huf353691575Idr16298441224Ils3490546Imp0738027Inr85901875Iqd1309755574Irr42115403271Isk126967497Jep0738027Jmd159556744Jod0709Jpy143095858Kes129209976Kgs87526541Khr4017643761Kid1540706Kmf43111872Krw1365045979Kwd0306446Kyd0833333Kzt510049325Lak21654678338Lbp89500Lkr299333034Lrd199640725Lsl17823672Lyd5450968Mad9178885Mdl17255168Mga4545388597Mkd5391438Mmk2099190991Mnt358471567Mop8081387Mru39744846Mur45651131Mvr1545626Mwk1738690354Mxn19199799Myr4246963Mzn63856084Nad17823672Ngn1579229001Nio36789574Nok10105458Npr13744291Nzd165986Omr0384497Pab1Pen3622811Pgk4163544Php55762658Pkr282661141Pln3751502Pyg8007973589Qar364Ron4437204Rsd102963621Rub78988168Rwf1440611879Sar375Sbd8553198Scr14613387Sdg54402363Sek9584619Sgd1287008Shp0738027Sle22710139Sll22710138702Sos571544887Srd36793337Ssp4576879113Stn21469718Syp12934116311Szl17823672Thb3263832Tjs9983808Tmt3499596Tnd2952136Top2358362Try39226074Ttd6777637Tvd1540706Twd29885239Tzs2674129453Uah41498185Ugx3642222558Uyu41698493Uzs12850183359Ves979031Vnd26080861932Vuv12023561Wst2752197Xaf57482496Xcd27Xcg179Xdr0736059Xof57482496Xpf104572422Yer243474557Zar17822992Zmw263817Zwl69312() {
		return {
			'USD': usd,
			'AED': aed,
			'AFN': afn,
			'ALL': all,
			'AMD': amd,
			'ANG': ang,
			'AOA': aoa,
			'ARS': ars,
			'AUD': aud,
			'AWG': awg,
			'AZN': azn,
			'BAM': bam,
			'BBD': bbd,
			'BDT': bdt,
			'BGN': bgn,
			'BHD': bhd,
			'BIF': bif,
			'BMD': bmd,
			'BND': bnd,
			'BOB': bob,
			'BRL': brl,
			'BSD': bsd,
			'BTN': btn,
			'BWP': bwp,
			'BYN': byn,
			'BZD': bzd,
			'CAD': cad,
			'CDF': cdf,
			'CHF': chf,
			'CLP': clp,
			'CNY': cny,
			'COP': cop,
			'CRC': crc,
			'CUP': cup,
			'CVE': cve,
			'CZK': czk,
			'DJF': djf,
			'DKK': dkk,
			'DOP': dop,
			'DZD': dzd,
			'EGP': egp,
			'ERN': ern,
			'ETB': etb,
			'EUR': eur,
			'FJD': fjd,
			'FKP': fkp,
			'FOK': fok,
			'GBP': gbp,
			'GEL': gel,
			'GGP': ggp,
			'GHS': ghs,
			'GIP': gip,
			'GMD': gmd,
			'GNF': gnf,
			'GTQ': gtq,
			'GYD': gyd,
			'HKD': hkd,
			'HNL': hnl,
			'HRK': hrk,
			'HTG': htg,
			'HUF': huf,
			'IDR': idr,
			'ILS': ils,
			'IMP': imp,
			'INR': inr,
			'IQD': iqd,
			'IRR': irr,
			'ISK': isk,
			'JEP': jep,
			'JMD': jmd,
			'JOD': jod,
			'JPY': jpy,
			'KES': kes,
			'KGS': kgs,
			'KHR': khr,
			'KID': kid,
			'KMF': kmf,
			'KRW': krw,
			'KWD': kwd,
			'KYD': kyd,
			'KZT': kzt,
			'LAK': lak,
			'LBP': lbp,
			'LKR': lkr,
			'LRD': lrd,
			'LSL': lsl,
			'LYD': lyd,
			'MAD': mad,
			'MDL': mdl,
			'MGA': mga,
			'MKD': mkd,
			'MMK': mmk,
			'MNT': mnt,
			'MOP': mop,
			'MRU': mru,
			'MUR': mur,
			'MVR': mvr,
			'MWK': mwk,
			'MXN': mxn,
			'MYR': myr,
			'MZN': mzn,
			'NAD': nad,
			'NGN': ngn,
			'NIO': nio,
			'NOK': nok,
			'NPR': npr,
			'NZD': nzd,
			'OMR': omr,
			'PAB': pab,
			'PEN': pen,
			'PGK': pgk,
			'PHP': php,
			'PKR': pkr,
			'PLN': pln,
			'PYG': pyg,
			'QAR': qar,
			'RON': ron,
			'RSD': rsd,
			'RUB': rub,
			'RWF': rwf,
			'SAR': sar,
			'SBD': sbd,
			'SCR': scr,
			'SDG': sdg,
			'SEK': sek,
			'SGD': sgd,
			'SHP': shp,
			'SLE': sle,
			'SLL': sll,
			'SOS': sos,
			'SRD': srd,
			'SSP': ssp,
			'STN': stn,
			'SYP': syp,
			'SZL': szl,
			'THB': thb,
			'TJS': tjs,
			'TMT': tmt,
			'TND': tnd,
			'TOP': top,
	
			'TTD': ttd,
			'TVD': tvd,
			'TWD': twd,
			'TZS': tzs,
			'UAH': uah,
			'UGX': ugx,
			'UYU': uyu,
			'UZS': uzs,
			'VES': ves,
			'VND': vnd,
			'VUV': vuv,
			'WST': wst,
			'XAF': xaf,
			'XCD': xcd,
			'XCG': xcg,
			'XDR': xdr,
			'XOF': xof,
			'XPF': xpf,
			'YER': yer,
			'ZAR': zar,
			'ZMW': zmw,
			'ZWL': zwl,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Rates].
	factory Rates.fromJson(String data) {
		return Rates.fromResultSuccessProviderHttpsWwwExchangerateApiComDocumentationHttpsWwwExchangerateApiComDocsFreeTermsOfUseHttpsWwwExchangerateApiComTermsTimeLastUpdateUnix1749081751TimeLastUpdateUtcThu05Jun20250002310000TimeNextUpdateUnix1749168621TimeNextUpdateUtcFri06Jun20250010210000TimeEolUnix0BaseCodeUsdRatesUsd1Aed36725Afn69563131All86259086Amd383969208Ang179Aoa917849558Ars118433Aud1540763Awg179Azn1700083Bam1713923Bbd2Bdt122163894Bgn1714369Bhd0376Bif297617376Bmd1Bnd1286981Bob6927421Brl5635854Bsd1Btn85901818Bwp13409475Byn3272455Bzd2Cad1368332Cdf289088027Chf0819649Clp940506035Cny7182925Cop4103044505Crc508445534Cup24Cve96626874Czk21760166Djf177721Dkk6535347Dop59040358Dzd131670115Egp49652593Ern15Etb134694232Eur0876353Fjd2253649Fkp0738027Fok6535419Gbp0738056Gel2731085Ggp0738027Ghs10327023Gip0738027Gmd72691587Gnf8692583678Gtq7682957Gyd209193253Hkd7846007Hnl26048538Hrk6602595Htg130850941Huf353691575Idr16298441224Ils3490546Imp0738027Inr85901875Iqd1309755574Irr42115403271Isk126967497Jep0738027Jmd159556744Jod0709Jpy143095858Kes129209976Kgs87526541Khr4017643761Kid1540706Kmf43111872Krw1365045979Kwd0306446Kyd0833333Kzt510049325Lak21654678338Lbp89500Lkr299333034Lrd199640725Lsl17823672Lyd5450968Mad9178885Mdl17255168Mga4545388597Mkd5391438Mmk2099190991Mnt358471567Mop8081387Mru39744846Mur45651131Mvr1545626Mwk1738690354Mxn19199799Myr4246963Mzn63856084Nad17823672Ngn1579229001Nio36789574Nok10105458Npr13744291Nzd165986Omr0384497Pab1Pen3622811Pgk4163544Php55762658Pkr282661141Pln3751502Pyg8007973589Qar364Ron4437204Rsd102963621Rub78988168Rwf1440611879Sar375Sbd8553198Scr14613387Sdg54402363Sek9584619Sgd1287008Shp0738027Sle22710139Sll22710138702Sos571544887Srd36793337Ssp4576879113Stn21469718Syp12934116311Szl17823672Thb3263832Tjs9983808Tmt3499596Tnd2952136Top2358362Try39226074Ttd6777637Tvd1540706Twd29885239Tzs2674129453Uah41498185Ugx3642222558Uyu41698493Uzs12850183359Ves979031Vnd26080861932Vuv12023561Wst2752197Xaf57482496Xcd27Xcg179Xdr0736059Xof57482496Xpf104572422Yer243474557Zar17822992Zmw263817Zwl69312(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Rates] to a JSON string.
	String toJson() => json.encode(toResultSuccessProviderHttpsWwwExchangerateApiComDocumentationHttpsWwwExchangerateApiComDocsFreeTermsOfUseHttpsWwwExchangerateApiComTermsTimeLastUpdateUnix1749081751TimeLastUpdateUtcThu05Jun20250002310000TimeNextUpdateUnix1749168621TimeNextUpdateUtcFri06Jun20250010210000TimeEolUnix0BaseCodeUsdRatesUsd1Aed36725Afn69563131All86259086Amd383969208Ang179Aoa917849558Ars118433Aud1540763Awg179Azn1700083Bam1713923Bbd2Bdt122163894Bgn1714369Bhd0376Bif297617376Bmd1Bnd1286981Bob6927421Brl5635854Bsd1Btn85901818Bwp13409475Byn3272455Bzd2Cad1368332Cdf289088027Chf0819649Clp940506035Cny7182925Cop4103044505Crc508445534Cup24Cve96626874Czk21760166Djf177721Dkk6535347Dop59040358Dzd131670115Egp49652593Ern15Etb134694232Eur0876353Fjd2253649Fkp0738027Fok6535419Gbp0738056Gel2731085Ggp0738027Ghs10327023Gip0738027Gmd72691587Gnf8692583678Gtq7682957Gyd209193253Hkd7846007Hnl26048538Hrk6602595Htg130850941Huf353691575Idr16298441224Ils3490546Imp0738027Inr85901875Iqd1309755574Irr42115403271Isk126967497Jep0738027Jmd159556744Jod0709Jpy143095858Kes129209976Kgs87526541Khr4017643761Kid1540706Kmf43111872Krw1365045979Kwd0306446Kyd0833333Kzt510049325Lak21654678338Lbp89500Lkr299333034Lrd199640725Lsl17823672Lyd5450968Mad9178885Mdl17255168Mga4545388597Mkd5391438Mmk2099190991Mnt358471567Mop8081387Mru39744846Mur45651131Mvr1545626Mwk1738690354Mxn19199799Myr4246963Mzn63856084Nad17823672Ngn1579229001Nio36789574Nok10105458Npr13744291Nzd165986Omr0384497Pab1Pen3622811Pgk4163544Php55762658Pkr282661141Pln3751502Pyg8007973589Qar364Ron4437204Rsd102963621Rub78988168Rwf1440611879Sar375Sbd8553198Scr14613387Sdg54402363Sek9584619Sgd1287008Shp0738027Sle22710139Sll22710138702Sos571544887Srd36793337Ssp4576879113Stn21469718Syp12934116311Szl17823672Thb3263832Tjs9983808Tmt3499596Tnd2952136Top2358362Try39226074Ttd6777637Tvd1540706Twd29885239Tzs2674129453Uah41498185Ugx3642222558Uyu41698493Uzs12850183359Ves979031Vnd26080861932Vuv12023561Wst2752197Xaf57482496Xcd27Xcg179Xdr0736059Xof57482496Xpf104572422Yer243474557Zar17822992Zmw263817Zwl69312());
}
