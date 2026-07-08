Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011035.outbound.protection.outlook.com [52.103.68.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC24CB5B
	for <sophgo@lists.linux.dev>; Wed,  8 Jul 2026 01:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472679; cv=fail; b=jfbYhUWlqvOgJ0obCPHGO3B8RGCL7eETudHoWS+NelyDvi7CFwO5qBK3I7lYOVaKJz8A0yO9iCDnJMNAGr6h+4ubKv1SDuwTsjFsZkcc/E1sZiVKPmaE2CTSQM/XMofcWHqeNMNWgYKmmW+yLJiCm+fNGhsJ2GFcj8PWI7X2SkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472679; c=relaxed/simple;
	bh=c1sl6iIyZgtTDtsPtCJjwFUx0dgTSFDrisDP3u9R6Mk=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=IlG6CE3kRPGX9joMALVRKv1fSKsbKlX3RGbRSNl8LHQGx4KhOURmS6IN4Dsx8dFK1q+o7es1hT/dQF0VQcclu7JsiKJwAiS1sm5v7mEHQqIClkbyDaB8h7rI9TOXidx88wzgefrk06PeZcOQ7LQnG8dw0aXudvsE59BDaoWPhAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=r2bb69Mm; arc=fail smtp.client-ip=52.103.68.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="r2bb69Mm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5316RWtWBBLNJ+pP1cBneOToC2jen39LiQioVzBV/CuK2Rwk378tUOv0+JwiFLWK7j9S+ca8ojLzanknmr2/RvH3c4dhHFmMkE8U+l7cQdImB/OFz/r862q+TWPFxKbb1V0mcKeKHZ6eQVQcut7qkBpMNtqyKsc0fhSWaVRlsGFdAQO1XBwr6FJ4mtBFYjDsS3N+kVH6fLv06aEs0gbabQ1hFxh82uhvQSs72DdMTjKGhf+yG5WcF1jFN92WYOSMAHra74ZDncybJ0nciXRbypmScD/Ad9XmUJhWX7zhSr8IgDsF0pcjmzEC/W8ZStYKhBE5GWS+rek4fxhAA445w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+dpFAorrioyzS+vU2/einvWGDvGss5Va3ZlFGyA8N8=;
 b=R9W3kFrwSG5albxN6hJmyzTlVQHRKo/l5qYKXxaCJxTbI6pEHwbp7CDapj8EaTLg2p6iTnw34r/ERm15tMvOEvfuf1Pi5ulFYTn+ytT7NmbGhdZpl/yI0pjFpYEpD+egF7VDkoI+jKHKro8ugPNnDYdiRbFXU3Pe6wsFI6o3vlK5k4M6iICyaEGbaOZc4XmDNVDGkEQRsBQB1q45lfweIXw8iHY8bq5EfgunIk1YRlNRF71xAjs+8R9MZajTCgXrVCUh0ERvz4+dEIXyw66MO3Riv7/CkU+6JWorSKD0NapOvY6KwlGUwpUq+oIimk21cbGCq3/anxdyy04eQqX9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+dpFAorrioyzS+vU2/einvWGDvGss5Va3ZlFGyA8N8=;
 b=r2bb69MmS+z4d5B89SYsEQTLZSOsG9yHevM1Gw7fC47Uhib2vWmmP14RokPjb+6bBYGTZVXdooy/hVsD/zfn8ntA5t1/6fCpu6QE+qVWU6btUYvNduO9VEmpQv3TQS2ZRzB8zUYRwpDps1rAJxRZHg8NimKyF3sgLk0zgY/u352i9gwqonKq+5+q9TP3bqIRyHn2Vo7iKMrnWACdwFL7MX2HhhJ2zRQvGRUeoFdKf8zyoOzxYXwtScpmXQ/B2uGTtx8uDAXWLDgNzGAgvr32pSim2JQpu573agQsj0aZ3WpU/7ljYgwIpdB7SifWqAnl8MfTglEXaWJJBnyvQRgB2A==
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:230::5)
 by PN0P287MB1272.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 01:04:32 +0000
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73]) by MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73%6]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 01:04:32 +0000
Message-ID:
 <MA5P287MB6080E05614BCD190DFEBE453FEFF2@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 8 Jul 2026 09:04:29 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jul/08/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::10) To MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:230::5)
X-Microsoft-Original-Message-ID:
 <f0f60969-4329-4a30-8677-4e2a010e3f19@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB6080:EE_|PN0P287MB1272:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e874a6a-0afe-4b9f-fbdc-08dedc8cde7d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22091999003|24121999003|15080799012|24071999003|22402599018|24021099003|25031999004|23021999003|5062599005|8060799015|25010399006|5072599009|19110799012|4140399003|6090799003|20031999006|39105399006|10035399007|23121099006|40105399003|25131999003|1602099012|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkdGTXQ5THRQNFpHbFpBS1Y2UWV4bVEycElzMnVVUXo4eEFuOXFKQ3NySXFW?=
 =?utf-8?B?RE9NM3ZlWEVHS0RldkxHYXhTcDBiN0srb0xJN0Vic0M2UTdSN3lsV25kakJ5?=
 =?utf-8?B?UUt6V2ZaTGVvUGNTT1hySldyczQ5Tk1pK0Q3Y1RYWE41bFIyQkorcGVRRm1B?=
 =?utf-8?B?Q251bjVyamo4anV1N1BnQVdkbzZOdlhIckhDZllYSkkrbHZrb09odlVrOXQ4?=
 =?utf-8?B?aTc2cmNYMStITHd5YzdrSktjY0tsVnZ5eTNmaDdUUktHcWtUc3lOaXhib1B1?=
 =?utf-8?B?VWFIRjlKME9acXoxVUdyWXIxeHVjWVhHZFkybEJIZUZpTFdwZHcwQk5lK3FN?=
 =?utf-8?B?ZUpxVm93UksyS2YwMVRxd0JMS21TY3AwS3hNY0txbU5vbmJhNXQ0cDlhYkt3?=
 =?utf-8?B?bDBGQVp1YnRweXIxc2sxcUFiS3MrWTB3dzBVaTJ5TFo2WFAxMTMvaUdPVEJk?=
 =?utf-8?B?VzJHUlowZnM0UVBzMkU4NStMRzlKeW1iM3pCQUdGOUt4dXMwV1RrdFpjZWkw?=
 =?utf-8?B?eVZyVkxBSW00YVhqK1FDZlp5Y0lwZlJxQjY3L0ZFVG41TE1UL1RBa2FNRXpU?=
 =?utf-8?B?b2tWdXFLNmszeTVoNkZ6UVRpOHlueUNld1RyUzZUdTkrbE5Za1lWdFgwNVlK?=
 =?utf-8?B?bjZXSWwwN1BiZXFQTnhKc2ptNXRhTno0Yk04VExEN3pmaFFhWFVRN3cwRkoy?=
 =?utf-8?B?MnducWJTQ0V6SlNxMmd0bStsdGpGN2xRYTZrRW9GMDJVd3FPS1dyaFdhaTR0?=
 =?utf-8?B?RG1ZVnlkMXN0bVFJbmswZk1LWkZHeW1UTUg0eXRiT1BFR0RxcmZiTHhnVmJX?=
 =?utf-8?B?ZTllR1NMbUFjbzl2U2lyMk9CSkdmd1AzanhyUWVKOEx1NlpNWEhUWVhhOFNr?=
 =?utf-8?B?eXhKVlpHbStBOXlmREZyajJpR2k4NUl4WnIxay9uZklReEU1SExZSnEyNHVK?=
 =?utf-8?B?U3h2bW9yaXd2blpmYUFTMW1iWHEwdjR6V2RrM0JoMGU0eEpQbUhmcElxVmto?=
 =?utf-8?B?RlhXWjJyQmVSZ2Urb1hIcU5zeUFSNUM4WFZkR0tWbHFPL1JwVm5ueThvMG1r?=
 =?utf-8?B?bXRXN1k1WnNLTDArd3NjT3BrYkRHU25pTnF2d1hWd0ttRzk0Y1hXWDNFdWsz?=
 =?utf-8?B?SXNUTFplVk1mQ3l4Vld0d1ZqdmtRY2lrQitmeEtYOWN3Z2lJem5sWTlsblVm?=
 =?utf-8?B?MzJuQWx2OUhodHNZMndTbEExTSs3cDY4cFEwNUxMem96cFB4enQ4dng3Mll5?=
 =?utf-8?B?M21tOUdEaDU3UC83RExWOXVSWVdGbDZZVFU2aXhISndhYU9IYmlSZ0J2T2U4?=
 =?utf-8?B?UkNEMlFqSTBaU3BWQjdicjJmS2dVWHdzSncrSmlOWnFDeWx2M3RnWjFOblFP?=
 =?utf-8?B?Z3VmSEVIeURUd25nRWw4M2F4V2pRaDRITllhZWRXSU93QUErdzNHR2cwVmMz?=
 =?utf-8?B?NWNDUUlsNm1HdE1TdjF4OUFmdGJ4UnpROUlDQVJWYzlMemJ3djZ1aUhNOG1H?=
 =?utf-8?B?U0E2N3kwS3Y0VVNkc0wwK2cxVFRVMVNyYzRYRHF4WFV6RVRKVC9SNnVoRlF3?=
 =?utf-8?B?MUMzckVxc2IvcmVNT0FhbTg5d3Blb1ZaZGJNd3p2NW92T3ZJQzBmdmE4dEhS?=
 =?utf-8?B?SGI3WW01Z2M1Tm5neVplM0kzY3V5UEU3SEtWenlXSVkrd2NsanlmS3dlanJU?=
 =?utf-8?Q?seOrCrcTD32r+ehQIj8h?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjlPQUR1a05iWEl3dm5WcGpjdDNobmt6aHdTV1R4cFp1QlAvUWZXVVVNUkk5?=
 =?utf-8?B?UjdMdmllZGFFa3hya3FjMU5xeGJNb1JqRTRsNlhuUDJjaXBkUWFjSGJYMHJC?=
 =?utf-8?B?L3FhS29qZGZpU1dKV0RkN1FJMllIZStQRjRNYjFseHp6STI3QjRydUtLMEZK?=
 =?utf-8?B?Y2hib2E4dGljNGhyTUplTkpib2hHNDI3Slh5RURRZGxVemNBdnJnc0s4YWM3?=
 =?utf-8?B?eXNKNFRDdnJ2TVMrOEs0Y1A2cEg1TWdWeldkbmRiSGJDV0s0OHRUdFMzZ01T?=
 =?utf-8?B?NDQxRStXU0pkajNaVnA5VFF4NWtSTnN1T2hGYnVFZmRPekNqUG1JcHF0bVk5?=
 =?utf-8?B?YnA2T1lCQno2MnlxOS9ZV0c4eWR4OUlNV0g4am9hTHJHOUxZYjlPSTdzb09s?=
 =?utf-8?B?ZTkxWVYzM0RGRFpDRENFY2gydUtqb09LMmxiQzJPVW5rMVdvWHFyL2lwZTN1?=
 =?utf-8?B?NnYrMkVrYXhVNjYzOVZnR2VQR3JqRE5MNUtjVWQ5VDNCdW11RXBCeWl6TzFH?=
 =?utf-8?B?NEtSZE1OOU1WV1VZZE5FdXl0VE1UUG8xeDkyM2loOUlsdVhlNndBSnpHN2dC?=
 =?utf-8?B?RVFOeUVUcGJONVBjN2RwWXBnRWZYbFFLT2w0YXBoN0J6encwZnFRTUlaQjdW?=
 =?utf-8?B?VFIyUHFRZTRNRzIyOWthRHkwR2FoelJnbzBIazN5RVR0TkduZFJJdFA1SzRE?=
 =?utf-8?B?eG1maUlXL1dVTnBNN1dKcm00eFVvOXRRNlhCcXJMSTd0ZjBHNVoyYjNIY0Zr?=
 =?utf-8?B?YVJwSHg0bEVaWFk5dzFEcFp1blVBdEVvMHZQak1sZTEwSDRaSnRiTlpOeGdQ?=
 =?utf-8?B?UkV5MlVoUlZGYzM0VG93U01Ed2FubXp6VEFVZDRVaG9ha1E5bnZVUmwwL2tZ?=
 =?utf-8?B?MlhESnhxU3FManNVb1R1OFN6ckU4a0Jpc092cHU2ZXVzSG1CUnhWckV3S0pT?=
 =?utf-8?B?YmFCSkQ2VFBabDNQVDd3VDN1THdqTTBPeEJyejQ3L25SZE9TYUNzc3ROejlx?=
 =?utf-8?B?Qm50MVp2aHNmUVJXUkc3UWhPWFRqNStmK01jcEJKMm05d1UxZmluU3VycHFB?=
 =?utf-8?B?ZGEvRk5wSTJ5dndoMC9MYkxiWGNYSnJETDc5VWQ0Zm1seTdQRFQ3YXRieDUv?=
 =?utf-8?B?dGh5TWErODVoZ2JZTUE2bXJabWsvZy9xMWdSbkFEOGZWRWNDWW83WnAwNkpY?=
 =?utf-8?B?U1hyV24xSmZLSlpRZXZLMFc4UjE0VjFsa2pzVm4xNEsvM0xuSDUzUDNRVXFO?=
 =?utf-8?B?Z1BHSUJuWXZiQ29NcTNlc21meVBtTWxSMzFuempNcldTNEcxazR4ZnZXNGhk?=
 =?utf-8?B?cXFYRkZJTkdVdFdKSHQ0WDRsYWpxaDk3SWYxaXcyblVGNktOM0kzcWlSd2VO?=
 =?utf-8?B?SGFoUEpZWXQ0SW9hMldoK1M2WGE5dC9MSy9ocWhWRm9VYmtmS04xWmtYTjl5?=
 =?utf-8?B?cSsvRUJxS0NndldNWWpYSHAvY3FZbGxhbXRIZnRWblVpWjNMNUdhNHhSWjlX?=
 =?utf-8?B?TVEyNDJXekJONmh2dmlQSDZjWGF3SEFlVjlnUnp1d3k3QWVHSS9pUDJYUG9Y?=
 =?utf-8?B?bENMUlZ1V2x6cDdqK1VxS0NqSWtSM1RXL1NKYkZqOXZEWXZWWUJVY2xNSUlh?=
 =?utf-8?B?OHdwcDdIdzhUcGFkL2toVnBSOHg1UW8yYktlZUxEVUUxL21jOG42eWRpcXNo?=
 =?utf-8?B?eTArQmdBRnV2L1B3U2RqZllpeGpaU3k3SS94SUloWmJDeFdwR3FxcU43TnZM?=
 =?utf-8?B?MGI4cnZIMWRaV0ZheHFScE8wbVVYdHdJQVhQOE1xNzlUSHVlM0czZVgyNXdi?=
 =?utf-8?B?SzZsdEZLTjNBQ3FGTWFWVWxabEZXL3JlU2h4emIwRXN6UlA0RDB3M203REtp?=
 =?utf-8?B?L1hLdURnRXp5UG53dG5wQmh6VDhCdWdmaUtwMzkwMm9mY2lSZHEvZlFpUWkr?=
 =?utf-8?Q?gy5qirzzUDAwyEBr7L6vcS0qJUzrYrV1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e874a6a-0afe-4b9f-fbdc-08dedc8cde7d
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 01:04:32.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1272

Linux Upstream Status updated: Jul/8/2026

Along with v7.2 released, some PRs are merged, see 
<https://lore.kernel.org/sophgo/MA5PR01MB1250024541E71412DDA04B4AAFE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM/>

CV18xx:
- Duo S support: updated to v6

SG2042:
- N/A.

SG2044:
- Add Zic64b ISA extension: updated to v4

Thanks,

Chen


