Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010000.outbound.protection.outlook.com [52.103.68.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207842D8785
	for <sophgo@lists.linux.dev>; Wed, 20 Aug 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678462; cv=fail; b=cr/zQhmnuNO7zmfNXe2iso9GLqyncIB1xJGxNj8SWUE6tmAHkp0h4TfG8ZHuX7ILkROrlAukvt3EA8AnZb49ZLsF86w0QbDhJlwyYIFSEZ1OIAwqHPEMS51fWhYRTxxDZOdzG5gkxfDauVC/X6S5qHo4CZJ070jey3zQITmz0yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678462; c=relaxed/simple;
	bh=i3bdDcWQvHWUSAUw9vYqOEGwVje4W5kWhHhz0uW3hu8=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=iq3ix+/zGaspsjXq7Z/pylNhSjTR1vVZ+MMtT3KDXKgLKOG1uUdBgrfsF1MS70hriNYbjTiBzCoFRtRcWPQdmWJs4JHKGE4feJwykam1gyPbsK0IbtyZeIYMWmuaF9vsWAnFLLXUQfvXmBUbBrpFX62x+iRaEHUWiSeDjjkusxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=f63O5pgv; arc=fail smtp.client-ip=52.103.68.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="f63O5pgv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gb7AI83nvLLUGtT7n1vqrMFtl3X3kHjXE6hJ3dMe/7MXMpIojyAEg57VpLw7k7DwQlBYNoHw9DMT8ENXqX57XD3+nmDQaUQiACr1GkLaP7s+Tyv3JgB9MB/OC9A/6yvIvgNurHmL5GbdFtyc3NF8FqUKAyROPpewgE5W//lT0uZVTz1pQVDvYmSbiHUNjM1aTt2ZrW5KeoRmzGdSrj1cWLegmvBz8u6IX19FnzeQV0kL1CmqrVeFn3UujPu2Z43KZKUKNEzmwb4yWL6VtH6NjzieygBoJ45tQPGy+1/832bjomLOPc98kKKcj0Srlm9NdMuGdlLpSV9NIqIA2IHxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzOb9DoGHyvr+R8as1359/rWmMVWrYLDmVjSshgrSGU=;
 b=bRhkt31ZqQWm6OJyNsR7mE4ysHIJO8Dmt1mOV/s1vmma9UT4Ys0WDp8PBZ78JUmyQtvJFsb6tqcbD1oYqreUhn4mJG++x/Ifnf6oWRyhiCoNhoFRTNffIL+sV9ZiA4nDEU3AS8ClFJukosrH+m5QVXCXady+0wGFs0hTSKh71HyDFKzThheHE7329HNmxA1j19TB9hbRJ/+EmZn7VKjAcqVjdezYwtvGaP/WAnc3j9DUwM5NNWvgjQW5JSFhV2rSgjvnjxJAeszQreRbu0ysGppaOPsuyEPp0QdH8KGBvVjZkWsCBTB7IPgzNIs4TBayk3CoK06i/3EsG/ze0Onz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzOb9DoGHyvr+R8as1359/rWmMVWrYLDmVjSshgrSGU=;
 b=f63O5pgv9GEtQE9bXxM7k4+BYINF8/wPHPLEtXhszhDo968MTs47B3ukuevshgNhw2/Y26GX/fSeO4dFL6SSm//zm9znI0qf1QVktUc5QJkESVtkyOSDwGJXcRPwcHEnWUIt+bcv2DBtwu9Ajubo5wv3C2PhwFMo7OCYLxOFJ/uCccXnTfGHLH2fBZLZUq1aFY6oJGawST9c4YkBRuiaiUl1uGOGLO4ZDxwlYyNbCo6sJHYxRu8U8DO9emIG2UUyjam9bsjSykEKPRi1U4r5WeKdfyd5GnyNvG+g+I30ZXvCzx82xkc88fsHHkZF7X5xgUDwZ46V/dOF3xPF2Rxcwg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN0PR01MB9557.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 08:27:34 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 08:27:33 +0000
Message-ID:
 <MAUPR01MB11072BBFEAEAE94F27545FCE7FE33A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 20 Aug 2025 16:27:30 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Aug/20/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0131.apcprd03.prod.outlook.com
 (2603:1096:4:91::35) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <8dc76730-7623-4cd0-91fc-82c1f751e699@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN0PR01MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: 14002eae-cd3e-428a-955c-08dddfc3695f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|8060799015|19110799012|22402599018|5072599009|461199028|15080799012|23021999003|51005399003|39105399003|40105399003|440099028|4302099013|3412199025|13041999003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2JONS9xanhURi8zc2hkS0Y0bzFheGVMWFhJODB4UUw0S01jV244aGMxTFdt?=
 =?utf-8?B?eVR6VWdBcHFEVHA5QUpEZi83aEhGNE95U0J3OFhJYmlrMnhBMEc3Szk5MkU3?=
 =?utf-8?B?SkFQK2VaT2pxUTl0QmJBMFFUbWhiSkF2T1BNRjhyV2FJZVJvSjBRQnllK0tJ?=
 =?utf-8?B?S2x2MmZZKy82RUUzaDZlL3JML0YzMEFmL3lnNkw2WXh5OWp1YVZUOWhlbVdQ?=
 =?utf-8?B?Ukg4ZXcyK1V4SENDd0V2TGlaTmxKS2RxMEJoOUJqNTUxNWJRaTlyUlJ6cXhh?=
 =?utf-8?B?MU91K2tTWllmT29VNkh1MURYVkJMWWpkN1ZTRFhxb0RRWnVBL1hZTnl1cW4w?=
 =?utf-8?B?VDR4ay9HeElPZXIzRkdEaEk1UkpmeGJGSVdzVUg0Rkt0U0NwVU5VT2ZwYmRt?=
 =?utf-8?B?bmZ2dXdxbkxJWGluZUlqTVY0cmp5L2s3dS8rd2tEOTdNWXdJV2RYdzYzVzAx?=
 =?utf-8?B?RTFUQTdUT3kxMlphcVdJSVhZLytEUU1QTDF4L2FOT3JFMC9zSlpkSWlqNjl0?=
 =?utf-8?B?UklDRGF1ZHhYNGdhdkkvTDlNVTdkSHZuUHBPZTkvazNuZXpFeGhaWmRRcUhY?=
 =?utf-8?B?OU5pNG9rSzNRcTJkcFNMeGwwZzExV2NmWVdmRGJSY1V4OGV6eVdlY2FHS2F3?=
 =?utf-8?B?V2dITGNrbnVQSVpQYU5Ba1czQ29yL0hHMkgxSFFSOHNiQk9HZ1E1a0J1c1JU?=
 =?utf-8?B?bUxuNEltWkZDV0ovU2tIODZnM2FLUUxuZWgrWmMxY2FEK0lyWnY4cUJic01t?=
 =?utf-8?B?MERBS3M0NkJqUFgzaUM5U1pKNG5SeDg4c2dHQ1NWWVVCSHVlc21EMlRmeXRL?=
 =?utf-8?B?akd1dUxacElIOFlnWWVyVXZhMjZmYnlDVWEwZ0c1QVpwVGZldHd1STEydko4?=
 =?utf-8?B?eWdnaEtuWjZlbXhyRDZJdlp2NTN5cVBOZGhuYlA4MjczUUx4MFl5STBZenY5?=
 =?utf-8?B?WkFVNmwzeVZEUFVyL3VPbTRpdWtlNjYvdlNiL2FXNmVwbkdmVmlsWWVmVEFP?=
 =?utf-8?B?Nm9rU0NmQjR0NVc4cXh6dzRJTVJ5S1B0SDkvZjRINnNUNlQxaWh6aW5Ga0JH?=
 =?utf-8?B?d09MTFVyQVNWQU5FS1p4ZTRjdnJWbXlvaFliTm5SRGYvTVRZdWh2REtOVUdH?=
 =?utf-8?B?VEE3cGRqeFRBcGpsbmlhc0l5OUVmRjFTeDNEUXdBL2ZrM0VnR0l2bjg1R2pi?=
 =?utf-8?B?ZGMwUG8yRkFkcjRnOXNITndGMTJqUjZ1YUlWK3ppMm5VTjFqc3YrQzNobFVi?=
 =?utf-8?B?RkZlTDg4N0dwemN0dGxlbXJDek94djd3U0NFS0pWeDU2ejFISUlMZDVyczBP?=
 =?utf-8?B?VVFGU1BzbkpSeStRS1hKZlByR1MzalJOOXhUSEZBeXo1QXVjZ2w0NDN6MWUy?=
 =?utf-8?B?Qm1nSDdZckJTMGVzMTUvMDlBWXFFa3NRUXN0elRERzI3MWVkejB5Z3R3QVV6?=
 =?utf-8?B?dlB5L3RTWWhQUG1tMkdNTUNMTzRnQmJ6WmdLODNkUkZBMUk1dlkzQUhGN0Ni?=
 =?utf-8?B?WXU1SGdUMUJMc3d2RERtenhVYlVtMndvQnBydzZhSnNEODJjWjJJTDNlK0ly?=
 =?utf-8?B?amM5VEtZTHh6Tmc0WkNDWXFBWmNHSERldUwwdlh1eVliRUlJRmlqS1dUMjFu?=
 =?utf-8?B?YWN2ZHp2WXpkSjZwVEpnbzVEZ0VCT1FWVUcyV3p3cjEvYjUwc0Yzc3VGZlo0?=
 =?utf-8?B?WmREbldidzVRT2FkQzhzd3hDd21uQitWQVZWbEluVjRiSXMzSHNnY2JBa2U5?=
 =?utf-8?B?RnUwdVRPOFhQS3pNS0o4V0haaFl0M1JkZ1FnT1M4aVVmMWZYeEsycTRQN2lU?=
 =?utf-8?B?cXdUSUpaL2o0cXZ4MFZPZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlZkc0padVkzK2d5em9lQ2tmQm5Pa2FvUEdocDJZY0xBdEhPUkxQMHIyYkVl?=
 =?utf-8?B?V0NNV0hRMHI4TWYvRU55SWRZUUd6T0crU3BQMUlYZ1k3MUU4NXJsaFY2U29M?=
 =?utf-8?B?Rit3eHB3cUlZVmJ6RHU2WnFGUnh2ZzJ4K1NScXgwQ1lvd2ZySHVpUFlDZDgy?=
 =?utf-8?B?QTFLNWV5NnhzK1hiMHQ2ak1vcnNQbmU1WEVaVUZxcEdINXYxeGwyK05zaHJx?=
 =?utf-8?B?Z01nZENPckwwVVMwTmx2NkN6QVUvdkY2am40VXFCUHhRTzVFeUhVdTRDNzRP?=
 =?utf-8?B?RmV6VGMvREx5RDNEcGVra3l1cWtHYW10WU8vWG44NHo0MkVFS3YyVFBiSlRP?=
 =?utf-8?B?WWNPd25tL2g1bkZXTktyNi8yamFURlMwSWhRbkh6RzhkS1g0eWxOY3poZlFi?=
 =?utf-8?B?THpzcFFMczZlV2lYUTZLWEJvK3dpRkVWcFlIYVpvTXRNRXdLMUZGcTYvMkky?=
 =?utf-8?B?MHp5aWY1cWVYSGxGcHZmOFlWN2NEL25pUFB5SS9tWko0TlZuNk43TjJ0aUJO?=
 =?utf-8?B?ZkowM3pRMkozTFZuQXJxanB1RXo5ekNkMEpaYytLV0IzSm9iT1lFQkppQXBR?=
 =?utf-8?B?NllIRyt2WGJWTm9TdGN4cFp4MVBMWFg5dEFBdmloYklPM1JtT0RQbWphdThV?=
 =?utf-8?B?Ny9jUTQ5Y1J3VWhqa05MMGpvV3c0MldDTzhNdVdCU0kwZFhiMmJFUWU4WE1Q?=
 =?utf-8?B?WVl2dHNYSFZiNnlZZFU3UGNTYXd5VFB2U3UvZEJIZEo0MlNSajl3aTZtSWJD?=
 =?utf-8?B?MWhpek0xbWpybXZJOVZBRVFsbW5oeVRHN3VOQXo3R3hOaHRSclBpUVBSNGxr?=
 =?utf-8?B?VVVyZ3Z5NVdNQmlPYTQ4alBrWms5Q1J4eWE2YXg1bXJjVzVYR3V5RGVRdE5N?=
 =?utf-8?B?N0p5MGtuSUZnc2VzK0lQeWJOWHRCbXM3cGhRQW9KbWpjOU5pTk1kQlNuSWVX?=
 =?utf-8?B?ay8xTUk2NGY5bjNCSVdWMWVMUWdzaTZlMmMvSngxNjh4SDhoQW5pVFhYaEhu?=
 =?utf-8?B?eW1MRXVWdm1mcDQ2YlZvUHRyMUZLTktHcXpxdnE5NlZBRDJ1aTg0R2VXU3JI?=
 =?utf-8?B?RWpVbWhwTjlncVEvaWREWXNvalhWT1AzVVhkSk1xaWY0VzFjY0hOL0xMNlI2?=
 =?utf-8?B?TlhlZ1A5bDE1akFnN0JvZ2ZsZXJpSHFWUGxpcE4yc0kvR09WOEhlRGpGQjZF?=
 =?utf-8?B?MXhYS0o1bmlidWh1bnhRK1d5ZHhhZVpMbHlIVThpRnZUVUxLRk1wS0t4YWpW?=
 =?utf-8?B?QWtKaGZEYnk3MytyUm1CNGJVUWhVZHhqVzhNa1VFU2QrbGExS2NIOFBiRDQr?=
 =?utf-8?B?MEFKcVJFMjUwUFdURUtVTkVzV0ZGeGE0alZMWWF4c0pzczI3eVFmL29uMGlI?=
 =?utf-8?B?OXpXTzVjd3NidXBQK1BqY1NCbmdlTzFyeUkrZVpXSGNMNkZBemdnRFV6V01o?=
 =?utf-8?B?d0NwY1hwTHRNRWpLU2pWRDg2dzY4UGdSKzVZLzk4eWc0RmNFVEM1MGJmTkpo?=
 =?utf-8?B?QjRJeXV5REZaTi85NktWUmR5d0JEMFhaVEszcnNaaE5HZm9sekNGUndOUjhr?=
 =?utf-8?B?VjdjeG5iZDE1a0xRdFZFcGlReEhEYlFnMlpMWFc4eXRJSnBTTmNvR0luZEs2?=
 =?utf-8?B?Nmo1TS81cTIydHdzakQxWVZQL05xcGtqcXRFek5LWmFJQlBsU3RTSHNBN3FW?=
 =?utf-8?B?RG5HcFhlbmZ1UzZCSVJJaytoOFVIQ3ZBcGZaM3RQRndGVGh0MXhoelNLbExC?=
 =?utf-8?Q?qqfz5EiexDy6zYn+PPkK6aVeNy20mb86GAfVpVu?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14002eae-cd3e-428a-955c-08dddfc3695f
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 08:27:33.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9557

Last updated: Aug/20/2025 @https://github.com/sophgo/linux/wiki

# CV18xx

- N/A

# SG2042
- SPI-norflash: DTS part v1, also includes adding support for boards 
such as pioneerbox/evb1/evb2. This is exepceted to be picked in 6.18.

# SG2044
- irqchip: affinity issue about PLIC/MSI, in discussion and submitted 
two patchset, one is bugfix for plic affinity, another is fix borken 
affinity setting in sg204x-msi.


Thanks,

Chen

