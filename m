Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8CE824A3
	for <sophgo@lists.linux.dev>; Wed, 25 Jun 2025 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833039; cv=fail; b=Z9np1TDKQVFMnt9qvQq7WROET39+jLcpFIVxr2pV6HD2VG6r7FYpbciGv+eXxs+4YaILYEj3nIQ2iHDj59Y39cczXlr1DFbD19ORSLg/TYGoSN4D+iTYWzfqWTt7kP45Wx1OvI3PEsXVpnUEZ3qXc1+Urh739scRiJ95HLY0Vs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833039; c=relaxed/simple;
	bh=1kpsIBu0m0FZJfYeSh+N/KEjEIocy0sM+JCXLrwXIzk=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=eet7SFowybj+Ji8rhlCZJQZr90vTQRzETz4TWqGBO6K/Mrnr4hMuyiYhOLbsQEcs5ioseCxkpFuynPLc+gyyB4Ru7Go2dm4xNn8XGlqMqUXFAKMdAoewBAG4CmIeUmCfpnP0dHWkFPgUjQZnoTqSLm2at+knWCxXBgH2c4IJj7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=k1PQZVAT; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="k1PQZVAT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9QgfIz55ttCcBowgKMHBCXr/onZrgdq1bpW4CgVXKhs4pqI5eFfGhZX0/58rEpEpmp7opvoIbkU6GwJY+9Bi9gxTeIAx7oKHyRIo3IZE93fikLRCQNr1GUS7UiNhbtIoGDLCnzA//Z8aSu053GSYmQK2oxTTkt2cYBjG5BEkwoafPD2sTBSTK1pRZHL1LKzJ1lAIchiG7jWAgLgWknW+O1Zy/CvkQvzIemk/vd7DucC2oYwbR0IibJMjd9DhuhX9TvLbrft5sANfk4I+py/uLRyHV5ZvB5JTRMAPRr6fejyANvb1+dszBQixms6e1oiFTM2GQDExFAyKz/n65wz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kpsIBu0m0FZJfYeSh+N/KEjEIocy0sM+JCXLrwXIzk=;
 b=vPI7ork1HmJ7B3NgcIWUju493oKygNjY278z/AZsXwCeMqOtg/62DOXGgVdVPt6O/kr6AvSNNgDG6JWv+GYr6ztlTAv4Vwn9pGhO3BII+oiw2ghmwmFr8QFQ1XvgwcBfCEfdFxiPI1g8WTWOhIuB6AKrnvJ2EcTLVV2TkAHxYD9/cpiY6Sk0JY6naoUExyvUIGjCS0QsADekW77nYsyaRPghUGarkwU/fh2ecNRc4iuEBj9uda4dDtLcSG0sLI/1uxHAjMZqr1lQqj8EtcBhDkOCYU/3XM/tMzBE+7PMtKRIXJ/T3f21ScP3kWiUoJhgJGHkhVqfJhIo95mDAjFfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kpsIBu0m0FZJfYeSh+N/KEjEIocy0sM+JCXLrwXIzk=;
 b=k1PQZVATkFfdoAVIr7nfrk5ielvBTt/XSdB62Zw7rKX+1XfofBleBwGPLBJKM0h/zFgT3m30ixUTGwq/nkEkRfBGIME1/eYM1SVZF1R3440SKVwacSE25YFOI7gYN5pDeDjCqz6FJs4cqjqjOi+PX7sRsOVWiRiD6r6VUAMHq6F8lr1GS/Od+Lumc6rSbLhtruP4kmidatP7SWJ1pF3HS1+CFVHEsaiDOB2gt9XIUgzeY1oXEBJsqVHiAKf+SGv97ReN3ZDuvrC12bl4SFnU+qwsr6XY/vkxCT1UcmeeKOcLxNA04zzoXGFo1QO8ZGbS5o75AYexX4ceCr0ndJeTKA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB1756.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 06:30:32 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:30:32 +0000
Message-ID:
 <MA0P287MB226289D8FFBDB64A7908DFC6FE7BA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 25 Jun 2025 14:30:28 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/25/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <c4d9cdb5-e314-4189-80c3-1be1e623d316@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB1756:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f5dd17-2874-4626-658b-08ddb3b1c90e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|22402599018|5072599009|8060799009|7092599006|15080799009|19110799006|13041999003|440099028|40105399003|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b25CbVZ0aTYvQ3lzalRnVm5rVm5WaStON0FXTnFuSDNhdnN2ZW9ubXgyTG5u?=
 =?utf-8?B?eVFHL3o5U3UrZkNoNnRuVHdtckRpZTVoeUdXREFLNERNc1J5OGZrVGliK1pF?=
 =?utf-8?B?TG04T2RhYVIrbk5XVWNURkFmVWZkUWlsVVJLMmYzT1pOMmZmVHJlODFRaVEy?=
 =?utf-8?B?R2pORU5PdDE2VEVTK3ZpMFJJeVFJbXk0bEZmL2xuK1VJbDhKSTlUS283RGFj?=
 =?utf-8?B?a1B5Tm04MTZDZklZQ3YzVjJVUnpOUy9MT3M4WnQvalgrZ0Vob204dXJGblBW?=
 =?utf-8?B?U3pGRmcvOERuSno2S3hTOERFV0lPVXZYZlMvR1FianNrZjBsV2cyMUJuRXl5?=
 =?utf-8?B?MlE0eUhaSllEL05TM0dnU2I2Z0ZXdVIwanpiVW5BWWM5dWZyRCtsamxBM2g5?=
 =?utf-8?B?NjI2SmttREtTK01zOU5UcVNGNnpFdUhncXQvOU5rWWNvWkE0SWRzaGtKU0Nz?=
 =?utf-8?B?Ti9LUXBGeFJvZlRoc2o5c0d4Z1dpRFoxRVVXVWpydCtVYjVQSWFsM1U2YTk3?=
 =?utf-8?B?MGxOVTFWbm9BYWJOdGpzeWlIeWNNZHpxMElxZGlBbW1PTHhJWVNHbnZSeTlx?=
 =?utf-8?B?OVhCQml2RWdIYXgvQ0FLeDZzN0RKc0FRUFh3NEsvK1dEbUFIM2ZPSmQvWCtG?=
 =?utf-8?B?ZzVLR1AvRnhBeXpnaDhnZ3d3eUZHVnhvb29Td0UvYmduY0JUekluQS9UeDNR?=
 =?utf-8?B?Mjhlb1dmcitiRkM3WWx4OFV2a3JRaVEzazFzVGlpejJmb1dpaEJkWmcrbWsw?=
 =?utf-8?B?aEI1RStlaVpIcmwrSGppZmMvR2ZIcUhkcEdZa2c3bjJqRHltRmRkRnYyWmkz?=
 =?utf-8?B?UW1OcFVVM200QWIyTmpTWFNXUmUydDJ3NkN5NE5UNllwVUNPOGxkTUhoa2I2?=
 =?utf-8?B?bCtRR1NwalZCR1l4VFRTYUpNbTRxQkFhVE02N3BOSlFMczkzczQvL3JzMkVy?=
 =?utf-8?B?bWZoZEN0N2kxNVdjYWFYRUVEWmk5T3c2VlJTRHpaV0NWWCtVZ3BrQjV5cmNv?=
 =?utf-8?B?SWY0V0JBYlFHRkpVUGNUZnpQQ2thZ3ovQUpjUUNzNy9yek54cWFwS3pySmJ5?=
 =?utf-8?B?Q2xRZXlCTUJzeXV3S0JGK2JzKzNnWjc0Mk9ObUlDUElsRjAvRS9qeHg4U1M5?=
 =?utf-8?B?VDZqQ0ErYUVlejlrMXZadHFaSldTWWovREE1K0c1N0dOZWF4NDV2OWxvcmlC?=
 =?utf-8?B?Ti9Ya0ZwS2J6cXZTS1p5UmFDcm9ER081dkJRamNJV0RsMFl5MlFFTVREV0JF?=
 =?utf-8?B?UVdJWTUraFlUdGc3Z212QmI5bnRZQ0RUQnhtUS9YRlNidjlibzdvUE4rTkdI?=
 =?utf-8?B?MUVqOWYwT2lLbGFuK3YxQlNzNTM1bzRKZ2tSN21acEZYZTZsVFRKdkZXeW1r?=
 =?utf-8?B?cXBWZTRjYzQvQ2lLOHAyQVNNallQeEF2NC8vVFNqZHc5eXNVSVFmMjNEQ0Vm?=
 =?utf-8?B?VFh1Ujc5YlVuV3I1QzZyaXZuZ2lra3hRQ2NWZnd5TzdGV2VnVEVJZTVvYlR6?=
 =?utf-8?B?QU00bnV5ZmJaVGdLN2c1aWlLSTVycHVCa3Q0TVg4TFNaT01OQjZ3QlJhVXJs?=
 =?utf-8?B?TWNYYUpmMUg0NnA2eHUvQWE5UzJKOExJbnFPS3ZOZ0xkV1YwMUU0QStwTjhC?=
 =?utf-8?B?UTBmdk9NY0hMck9OSTZVMytvcUVwaHQ2SDRBVnp0S0dHRkhzVDJUMGE5RmlP?=
 =?utf-8?B?Ty9SdThGaTdGZzlrYVhrb3l6YlpjQ0Q2V2VON2trT3FVMmpkSDFDZ21VaVZp?=
 =?utf-8?B?ZWVZQ1loeW40cWIwUVJha200SjRKT0FjRitjUEVVNFZDYk96ZWIveVRpM3VR?=
 =?utf-8?B?bHYxNnRwSmx3WjJzOTNvL1lpaXd4Zk5FRkI2TWVPQ1VDR3RJNVVBeHRTZm0z?=
 =?utf-8?Q?fKBcQdiipxmqN?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlpkV0JtNmhLN3MzZnV3Yy9rUythSDhTOHZBVElHUVYwdVoxT2U5aVVVRUhm?=
 =?utf-8?B?YTh0TG01RldqR3J3RTdGT0pXdjc1YTBhM3JMaVZxQSt3bmRVSlB6S2RtTUJv?=
 =?utf-8?B?U0Q5cjZqWWdIc2RBUWFLOE9uSmhPbWpLTW9kZWJHSDV4cFdrZlU0UUxNVjho?=
 =?utf-8?B?QU1sbzFMaE5FOWxmNEU0Tk13c1VEUkwwSmtZcFpxczkrSjB1LzBoZVhNU3lk?=
 =?utf-8?B?c1lxelpMcDM3ZFdwSWNIaWxXR0t0c3RkdytqUjNYQmhFVENlQUlIOHc2TER3?=
 =?utf-8?B?UXY3NWhIY3FPWFZvUVY4YmdlWkhsdElzVGJxN2w0REswdGJBRWJONmtYNm9r?=
 =?utf-8?B?YzVxNW9KZzZ1TVVXa0kxUjJRTWdQVU5veXBBdENpSVRkNWxxTG15QTIvaDZ5?=
 =?utf-8?B?czVlb25ZU04xUTdGd3k1SXFGVGtzUFhieG0vU3RGazBPNlZoWW1mYkVmSUZE?=
 =?utf-8?B?SFpYRWNFOG1ndEVBSElpTHAvZjFHbG9JcDlrcGFWUi9IbkNpOEFQd2hkdFhI?=
 =?utf-8?B?OWxaUVMveG8xVGJBa2w5SXBFa1ZoeDFGNGpIQ2RTeXpROEp1aVBXOXdiMEZs?=
 =?utf-8?B?OWw5M05xNUsvYzFiUGtFY2FqaFZZeGw3bkZlN2pIVC9BTmE2MGdub3liSEhJ?=
 =?utf-8?B?WUgzU0ZpUXJOWkE2RnNYM01nc3FHSi9nL284S0ljM0pUYnFmMDJkQUZPZVZ1?=
 =?utf-8?B?cnMzMUhXV0pxTTJDdmpmWExrZUYvYnJ1MjZCMGdoRDlmQzZZRTFhK0ltU2xa?=
 =?utf-8?B?WFdYSnFHbTUwWjVQKzE2d0dWdGdFQmxCL2czM1c0Rlkrb1Z2UEJ0dVJCRmdT?=
 =?utf-8?B?aWlDaTJBR2sxeGNwcUdQTWR0a3paN2hFVEk1L2pObldWbjNnU1piRXJPQVo4?=
 =?utf-8?B?Rms5Uy9qUURRUlRoaGhNUFlOTmpCR25zOVppbmlYcjh1SEpHb1YycERxaCth?=
 =?utf-8?B?dEQ0RCtaNzNXWkhTT0lyT0JudVNyM2Y2bVVROWpjYVo4b3FzVVlOVXFtN3J3?=
 =?utf-8?B?bUVmUU9qdGRRd1U2Zno2RDU1aldFLy9ZbU5VWlhTSStPY2dUMU9VZkNJenV0?=
 =?utf-8?B?L0VSOG1uSklIRS9xMWJCanJPT3Uyc21lQW1KZUFwRjNTQUtSMkVjZDRSSXNV?=
 =?utf-8?B?Q205VkpsVlJ3TERQRmZSbkZGUjRRelZIaG5FbzZ2WTBtRFFDZ29DZmhXaU5L?=
 =?utf-8?B?Rm5vbUlmUG1YaU9nY0xpd1UxbEhueTNmd2RuL2dwY3c2c1JRb3RxUURKMHNX?=
 =?utf-8?B?aENyaW0wcWE0MEJ0Zkd2MkdCYWp1V2RYaE0zU0ErSUZRbThZS2ZteHdQQ1Vw?=
 =?utf-8?B?M1NXUFVTeDVLQ3lUWHk2Z2NwbDluR01Vb3NLdlp0M2hsVlcrekVxTnJNbWJN?=
 =?utf-8?B?RUFub0N6QUlJVlJRdHhQRDFkdEU0cldxdlFaQ2JvSjhLa1FSVzVCTVlMekMx?=
 =?utf-8?B?T3NPVHZLUEJFQjFmQ01sak5mdDF1SytXT0pKTVNiZE1nTWhNTDQ5aXZrT3h0?=
 =?utf-8?B?WS9Id3dORGhPYm5oS0xobCtuVG1Fa05WTEJUZUI2NG1XMGN3SDRhSEUrNERW?=
 =?utf-8?B?all4OENBbFc2Q2NWQjIxQjJZdC9RRGhpaTNBekE1dFYyY2VScm9pdDhPYWdi?=
 =?utf-8?B?amsreGNKWW1INVNlb0hWSVdldjQ5QWtmbE85ZDYxbFpKTG9JRFN2RWR6MVNO?=
 =?utf-8?B?eEI3bHFsUGl3QnkvUk9ieldtU055UFBLV0NvSmhyT3NsaE1sWmdoc2lYb2xl?=
 =?utf-8?Q?odKlI9msVlQF1I5x2UbCqIb1yVdJQ0VCMDFBxmf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f5dd17-2874-4626-658b-08ddb3b1c90e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:30:32.4067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1756

Hi,

Last updated: Jun/25/2025 @https://github.com/sophgo/linux/wiki

Quick Summary:

- CV18XX: Ethernet driver updated to v2.

Thanks,

Chen

