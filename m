Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010014.outbound.protection.outlook.com [52.103.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD5335066
	for <sophgo@lists.linux.dev>; Wed, 21 Jan 2026 03:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965721; cv=fail; b=jTcsn2+6w7VmdmiXtRRN6J70bkerEUe/sdUeVpU6rRrXABj++oR+0mVQtigmlRTFJm96POKbzx9WhYSO9c33RZqN8KMZM7GKlxgo7KGiQphVGW0TtpF8UPRRz8CWvRXm15QAlZu84iNfYGxNG1ePTg6LmHjEUlB8cCclnTfhgtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965721; c=relaxed/simple;
	bh=+cNadToj5TtFV4j0gSZV2fMWek0DcJEXWxiMF8WxOcQ=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=R2sLD/kbK7f044OIkr/jBpwj9eZpdi0/uFYwrJR2S0Ao34L1L+OAi+M4TlyDwJFSDcMuKfyQTMaHTI0ujiVNqxh6iD82PYCAFnRXmGIx47G3D5cFjPvuefKzFNTMekR9KBaB96SJfCESZqBXBa6kBR6VaNt0KH+2qsIdKeFau4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=emIVR6ox; arc=fail smtp.client-ip=52.103.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="emIVR6ox"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S25OfUp+6zqu1S/Hee8QdqytAEZ0b+I50LdAQbBp6uUzxcpmoaf7FCfoYp94MBaUqJMybke7ccHZj+NBT/wv+u1v/UlmyYr5WNCDWbB2cfiNYj1OZIVKeErrm3KyM8/AUCbonCTzWkROgqVDTYFv70zn753X3BrETt6pJUbe3oxbTk1spdzHHfQekTss7EAslWKw1v6AtW1Xig6aS7Lu+rukPgQTDhFHEvn0JxVySj3CEgIbaLlRHcFkMhah0mVec1lLa4qwRSFzpKplDLvzMQpIz/xJDdBlfZmt+35OQgG1Tl6DISMhRFgB13zKMURcEKwa4mdfsvmoeVTcKyWChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jkg97bYymhL03eH7yHAiFZKuppTz+LxD+EC8KorCcg=;
 b=QTc/eq1t/RiwGxrmxcmWwCqcdkaQXW3KJ9ebl15cAtfyotVIaPWrBGDlEEcjkWA2juT1GC6monKD4WXulv8YwbcmLshlD0b77xFR78IAjQJtFJMh7zgdvoMj4A0aq8oUcP1WPH+JHmxgKQo/iCtwb7i4jsC7lDND3Q88ncEbfV+7ChPn3iYtR5WbXV4OVIoDq/fbeQcUs6+LLl9EZqkTOtP+UFMJRsL9xG1Ab2OKS7u1NoDY2qlqnaZLlyFC3lRm6VyKDZdEhz6n6TPRaUnDBPqK1vDM5yy0fQRq8V/xvtURnPhR/nVm7UpgbNJq3sFBYMsShUEsEl280O2kIHAuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jkg97bYymhL03eH7yHAiFZKuppTz+LxD+EC8KorCcg=;
 b=emIVR6ox4SvpOALfar9AbOzxvCHReb0UfcpNNzV4l+L9fpRPbXdeTA9QjUH1v4Xonuuo7fcPQPACaOYGjF2Aq6vPl0NyYLWq5j7Eqc2TiHcNhf0M713bYSlZQgd2Acq2QfMo6eqngpInN/0cdQbXs5DPgi3h+qLpvSHX0VwpVwDyMAuXjfd3XxAeyMQT681DgCdlAdlvUqrvV35ZD0OQ58TXg6DDibR3QxUWwZkl22eu00Ck6EnRepTSGa6WiRG7zMjgYXgRdUZwFbq1Aox78h5xx96EtNxJYLLDPjsBKlcl3guisx225nE/9xy5i2H7DJN6Fsq1u6m0dpJ9fsL8jQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA1PPFC06F2633F.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a04::a7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 03:21:56 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 03:21:56 +0000
Message-ID:
 <MA5PR01MB125007F93BCB96BB361652423FE96A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 21 Jan 2026 11:21:53 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jan/21/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <4b180b89-6939-4b3d-9bf6-98dface332be@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA1PPFC06F2633F:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7eb0b9-ccb9-4c7a-1fba-08de589c3afa
X-MS-Exchange-SLBlob-MailProps:
	CLk2x5OX5VYv3c8Emt0jD2wdZaenNeU3l13LLtZ+49ntfnrghphlDMskBHxExarRac4TcjOMCmIFZWFeTdPRJRHuZ7kQVDO1VfmV/zT90hFYCwYkF7hZiswRk66atuv74lxylhzJxg52aSRr1X0YsMOPXRo3QWCTPPUby62Fspjy2afPTDiURPlGEreZdorSdc9Y9iLD7ASdDvBJBLbxXzC2Zj0hslxFbt+4WhrsKAg0khkvm1OBFxZnJ+AA6wvefg5fd0TPi/PxtScJD8Udd9MCfu1W//m7L2iYi6GLCwCGnYvWIPezPaLJDB2XOOa57ue9CRDn+V8rfQcwbvddgx0I3MuTwzfjqKQIQ2oMWTKueIpNZ/akMzBjcddIWpJBpGVFux3pXjLboREi7OjgIgsaAIAFBm+ePhvm441St1DTBNCX1KndQYYOdGzZeQqXZPrT4RmxtO3pqeI1Ufm5wQaAGEYafubNFHq2JACYNbv2tzRbvRHKSytrrbyILtkesI6KK/oMk8Kc+W9tLvvQjrr7WTtuVEJq8qwPASWqovfvglv8urPaNlDa9pTvp5qw+NajeGTYZrzJF+5N0DvKLxyzLXd1xIodOkJ4YGMw7drPrmjOreEuMckco/FHvhIhOAJtmykKE9oBP1PbHtM1X6IWXURunUiYtQUIiOH9meJeRF0LZkL2Vh/aOZXrVSzTRCZtd9EhJ9orBhVw3a4YXQ==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22402599018|461199028|20031999003|55001999003|19110799012|15080799012|6090799003|5072599009|8060799015|23021999003|39105399006|10035399007|4302099013|3412199025|40105399003|440099028|1602099012|13041999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUwweWdvMmNOeGdMVnc3U0N0aTBRenZ3OWFHOVhBd2FYeGV2SUIzRlZIMGZN?=
 =?utf-8?B?cWlEOWxiTkZLWTJCdHRNbUlOaVdId1RhbHVGalpFS2hodFpZWENlZU14L0k0?=
 =?utf-8?B?OGlDS2g3ei9sYnZnVElOT21tcUp0T0p6aUZGeG04SG9MU2Q0d2ZsdVQ4ZWZG?=
 =?utf-8?B?UGJKRERjMFNiZWI0bzJ0dFRDRDdHSWFqa05sSThURUJSNXNCSyt3cGIwYVh3?=
 =?utf-8?B?YmlJT3dvU3J5ZjRmRkFqcmFCQjlMRnRMakw4Z0RVeEtnd3pSalRMS3IrZGdz?=
 =?utf-8?B?LzBtQjkzZ0ROZ0NwaHBWNzlEODBkK1hibUppRW9DZ2tqYk9rVmljT1pSRTB0?=
 =?utf-8?B?c1hQRVdIRkJuV3dGa0hscU5LYkVRanBYc3FQWnpBTUYrdWczeHI3KzRhaXN5?=
 =?utf-8?B?ZEt5SXhlWnlKeWVNSWJxbi9UUTNLYlVBdVpSRUVWMytPcnEzWUVBVVU5aUp0?=
 =?utf-8?B?ZGRpK3BkWjkwdnNWVDFBWXRaMFJTMzJsSVU5eGg1TGJFMlZrc0tmeDYyNnpo?=
 =?utf-8?B?VlRVQ3RmTXVVZ3FRR0FYWWdxQllMTDZ4bTBQQ1h3YkJsWTM4VGZTa25wTjhk?=
 =?utf-8?B?Qng2V3hlU2RWWXNLbTJVYTB6UE01S0ZHYThrNWltRFFXMjhWMnplMGRRTGpu?=
 =?utf-8?B?aWxyYS8yc2R0UzllaUp3UjdBWEUyK2hPMlg3WncyZUI0L1JiMHhWeVRMd04z?=
 =?utf-8?B?OCtHNDZuU0JpZjhkTEh0eU1ETDhDZDBjalg0ODJ0a01mQTdELy94SjB2V3da?=
 =?utf-8?B?Qlg4NU4vbUtGczljKzQ2cmtMOTBSa3grQnR3TlFibks4anJsVGJ0eUVXMEV6?=
 =?utf-8?B?eXd3V2pYSk9sNm9TSVJmTjlRMXFad0oyUDlBVEZiQTdRMmJMc0VRL0NPUHBB?=
 =?utf-8?B?UWdZVjB6SWN5RmN0ajZQbTBjbmFVOXZUbHdZSFJLV2h4RXRvM2FVZWlrRnFD?=
 =?utf-8?B?cEdXZllCdmFLK1NoaEN6cmoxTitUUGlKekE1Z3A4RGRaTkNhREVFeitvWTl5?=
 =?utf-8?B?UnNNcmd2QkRSdUw1dkpCM0FUd3dwcFhCZVpxam9jYkQ4eVlsZVFVaFZTMG5I?=
 =?utf-8?B?RUpsU2xUWjNMcFNyNXd1Z3JqVVd0TCsvQmlIdm4veFNXNVJEOFRkMk4wYlhR?=
 =?utf-8?B?WEZDNGp4TUE2bUlsa05ubENUZ0ZQVEUvdjhqT25weVlMdXRNUStJTXdKZ08v?=
 =?utf-8?B?UDcyYnByd3huY1ZMQ1lRSjM4dkhlTlcwN01WUzhIckJqdEVmdXB2WU0rcS8w?=
 =?utf-8?B?SC9ncGtURGpjZVdZYUZlWUdsWXZQSkJhbHlaSFJrMU5LblNZZml4Q1pvczYz?=
 =?utf-8?B?Z085emEyMWVyWVcxZ012TGRHMkdXU2JqNXVjdkYzUmIzSFk1b3VSc3BmRGJK?=
 =?utf-8?B?UUlUSk9rUUxsbkhZVVduUGtSSUIxUHBuQkkxTFA3MFZjekpxejNsd3g3UW0w?=
 =?utf-8?B?MDhNdVRXajB1OUFiZ3BCNnB4MU9SN2ozTjJKTEVQL1BTUWFjaFRNbVJMOHMw?=
 =?utf-8?B?V2xWSjlyYmFIdHpVM2pYUFQ3SlBQZGZlOEpnNloyVC9aaEtSdnYvQitmWW5u?=
 =?utf-8?B?NFFRTy96bVhvaWVsNFFSZ1JpTmtYMFFOaWNDUGIvVytMSmtmcnQwbE5XazB3?=
 =?utf-8?B?eUl0MmhRT0pINmRYd3hWeERvbVZXeDJERWt6ZHU2OU5RdjdFVURueE80RGJH?=
 =?utf-8?B?ZFU3Y0p6VU5KU29wS2J0S3BFQVZsSHRRVnQ4dkVUY1RYMGp0eENWWjUyQkpn?=
 =?utf-8?B?RWtVUStyN1FRbkQrRE9YQk16ZHdFUHdpL1A4bkV4cmlyL1B0c1FEQ1VDc0JO?=
 =?utf-8?B?cXptRnoyazJWS1NiaUltbDJtUHJBTnpnMkxFNm5FbDBWUFdYUEVLeEtoWmla?=
 =?utf-8?Q?IbdFuzETgJu8n?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a01yUGVsZjU0TFZVd25GR29hVHlzWEp2b21TVmhUSlI3V1BkZGtzRGE3ZDg0?=
 =?utf-8?B?YjJqTUF6aGplQmtKNHMrWlVYcVQ5cEZ2ZWl6YjR2T0VSM1BSZU83MHpyenpX?=
 =?utf-8?B?MWpSSWF3MTFxNFJlTzFxc2hGRXk1N1RpQUZMMWNxVUlkb0htd096Y2pqTmtG?=
 =?utf-8?B?N3hwUklieUVjb3Q0NDVvSm12YTNiUVg3RUhGdzRrby9RY3RWL1BRbURRQ3hD?=
 =?utf-8?B?WjNldGtkZlBPaEhaK1ZLejVVTytXN1ZXVS9hbjBNMUJTYWltemNMUHlVNkVE?=
 =?utf-8?B?UlFGTHZtREJLWlYvOUd5dFJNTXdFWWpqOUVjb3ZrSTUyOWdUNmUxNHNPNDNa?=
 =?utf-8?B?clp4Snc3UHhBOWxMUHdyYTB6a2lYNGRwYWk0ZExNcjVldzZUbXdrL2tnMk91?=
 =?utf-8?B?enljeVcwL1A4T1U1czVQbks1ZzJMeE9PaWlrRytDMDhLWUk2OVhQd0haeXVs?=
 =?utf-8?B?aXJpUlArYm1Sd1d2aDVjT1JzenNKTlpTL0Z3Z054VXhtYkZsd3pubXRLUkFa?=
 =?utf-8?B?WlIwS3JKME81dVBLTWFydjRvYXVaN21jRlNEQktxZFN1YjJCNEgyUlJ2OTRE?=
 =?utf-8?B?MzhQenM2N2xOUkpBSnBlYWMwaDR0dmQwQ0JPbnhjQWpDa1QvZXhpQlBCejZH?=
 =?utf-8?B?dVNka3owTDhIWUFqWjQ4OVBGSjFpQ3IzQ1ByM2xjNDV2Uk0yYThNRkptRFVx?=
 =?utf-8?B?OEh6VXRQTFNGWnU1UElld2VMTGRzNmhMcDkxRjQ4MFNsY3pJR2h0R05qN3pi?=
 =?utf-8?B?UjJRK2tSb3lLU2x6ZEVuNHB2RDRtK2V6RUo4YTRyVWZMdWhHQzc4MGgvM1JB?=
 =?utf-8?B?RlZnL1dYNnVFUW1XRVZqZE5nYk1FS3RGaXl5U3Jzb2lxQ1Z1U3ZmSnRwVlk3?=
 =?utf-8?B?WTU0RWRxRWMwRkxnQnZQRG9kTm8rUnRRYnVHa1VWVnBsdFZEQWJETk1DWnFI?=
 =?utf-8?B?ckJYaWYzSWRJRHppT0M1bTZPTzJuNEtYODNIUFBjWDhleFZrdHc3WmhCdGgz?=
 =?utf-8?B?ckFuKzUvU1FJb0JJRWRUc1dCUm50cDdvZVBuSFNRQlBOY3FpUlkyanZZZHNK?=
 =?utf-8?B?RHpWS1MwSWUzcWQ3d1Y0aUZWVmRIK1pCOXcwQ29yNlRsejVueWNvT05TSU5h?=
 =?utf-8?B?WTZMR0FXVUJ6YVdkYlgwdUFBODRNMjVXUTZhelRaWWo1RkNQWDl2Z05WaGJ3?=
 =?utf-8?B?RVQyeEZVdmNhTld4djBFbFBFRnU5WGRPMmYxS0Y1YTV1OTRwUEY4V2dweUVK?=
 =?utf-8?B?NmYzanhCYWY2N0NRL0M4bkdSRkQxaGxCSmlPRHBRWjdGRm9pWnNpVFZtbk9H?=
 =?utf-8?B?NGh4N0x3dWhhTnA4SndVSUxaNkVXNTNQUnc3WmlyTnZWd0dQN2tqM3V1dzI5?=
 =?utf-8?B?SGk4bnRGcFVvSWpXNzJzRnVJNnhQUlY5Zk5iSVRKYlkyVlVDNHdycGZMREhG?=
 =?utf-8?B?M0NRTWhjNnRKT2M3Zm8vTGI2T0E0OE9hNW9OT1hadS9hWGNFVURtTDJUZmFC?=
 =?utf-8?B?M2NYNEJ1Zy9oeldEZjBlNFMwOTg3Z2tDNTBMekRkVEx4QnlDSERIWEtWNFhN?=
 =?utf-8?B?MkZMOVFQQzk5anRRV1dDWTR0ZGwwZmEybnN2VGRINFVDT3dBQ3NmWU0zSGRs?=
 =?utf-8?B?MGIwWjRHTEx1QWZYRks0ZDZ0YmNBcWJ0WGo2aU9jeU5DMmZxTGc5d0xxUnM1?=
 =?utf-8?B?eFNyRFNZOU9hdGtxV3hDSXR6b0JSK2FLdittZUxmZTJ6eml2dlhkOGF6WCtC?=
 =?utf-8?B?S2sxVE1tU3p3NGdMaDNlUkVOTjgzQ1RaQmxHSmRTRjFXTUJITVhqaUd5OE5k?=
 =?utf-8?B?NXQvTU1hSmNWdTA1YTJkbkk4RVlNell2ay9SM3pvOGQ4dFE5b0g4WmI5UXlU?=
 =?utf-8?B?N2NsZVNnbndkSUxBYW1tNGllRE5McEk0bW5IQWJSL2JmMGpOU2VBb0tGVktC?=
 =?utf-8?Q?ZjI6V+n6Ii3ezZt7k8uNtQO/KOTbQGQ8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7eb0b9-ccb9-4c7a-1fba-08de589c3afa
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 03:21:56.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PPFC06F2633F

Linux Upstream Status updated: Jan/21/2026 
@https://github.com/sophgo/linux/wiki

CV18XX
- I2S/Audio: v4 submitted.
- Allow DMA multiplexer set channel number for DMA controller: v3 submitted.

SG2042
- riscv: dts: Move plic/clint into sg2042-cpu and sort peripherals by 
addresses: Applied to sophgo/dt/riscv, will be picked by 6.20.

SG2044
- Add "b" ISA extension: Applied on sophgo/dt/riscv. Will be picked by 6.20.


Thanks,

Chen

