Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011034.outbound.protection.outlook.com [52.103.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B82566D3
	for <sophgo@lists.linux.dev>; Thu,  2 Apr 2026 02:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097604; cv=fail; b=LtYSBiBJgYU9La1b2Kjc5DRzXSRhzTLjYBd3eZclLJhoyY+Q+ilY1XqZjXx3jHxvVRa48cNThFMx00GUBfoiyXpK3hI96YjeZ2nPwSzEUhZ6Xp2Oee110NcxF80EjWRKNMiQk2sQov9LeGkBt6+H4jzZqnb8iqwduHXP3wLwlUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097604; c=relaxed/simple;
	bh=DHb4eKXmlMc5qOY4eYj+auWo6yauy7PfR6GxzRsrAwc=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=WkrJ6/7YNzm3hpb16x15m5edFBFdR9cUGr3n/XuzYJ/cx9pA+FTyCTQbxvh+Ags6zITCAHvtR5wDhjDv2dpvkArkHBG5mDMBvZB4Kci/fnI9jyQcadaVpZlSBFDzs4qPL6zRFJzmZkUYRmllMgrGBl3KdqQgH4JtnZgF3a449b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CRWyL3cS; arc=fail smtp.client-ip=52.103.68.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CRWyL3cS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bxtlj82F3aky1BxXTRPQviDyp4icMXe0qEqITUyYTM3JTa6dsDloh+bttPOFn51MXMwrganWJK0VSCK3m4T73SSL6Nnp9cH8y4WauM47Fq3N6HDLgBzN3wbBNP5TAm37MV+vAc0QdOlQEvVUh8aMuMQCil2VHpr+Tf3Q1lNmz4Ue5Jma23c3nzxFzjIoPc3sbVEuMnF6f4/zf5la7H38ODomdxCnVV45xnnKCUyvPmm5UqYsFiwR54slQXFPmHBm4KEStwC8PNGkp4j+knwmWhn8dGuNAPEciBbVK9EzBS12D7DZlkZabNq4WEryftdr0WprYyP1t6EB/GPWSKLnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz5Ix9nxM9IhIjk4N5MNLsQPQgMHH6fZ4aUCWaQYZL8=;
 b=s/9ngk2IMj8gFQUpka7jOiXvJxwz0M974HA8Ml4f0/Dbc9czH29x3FgqONsTQAwtWEwmr7p6awohn4NiqQgPzubKaqhmOXYb3S+v2keluPlAqERCX0qtnhgPx+12lNafL1QK46i6wDkE5gLLojXfztaTm4l+Pd5i2OFApYGdwrzwGhBGI/isJT8+ScRcBvrTjF2OyQI7Be3dtxpMZ3rn3VZgZI+Lwqqphw2iNIu164m1C61F5270msnaE2oog1No/aQ9CzDOlSiSADlq2hd5ajqzzfG7IOExWkMtBSQb2NxCgsvOg6xf7nKpfC9bZlrURNCeFwR9+MbzGrVBazqE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz5Ix9nxM9IhIjk4N5MNLsQPQgMHH6fZ4aUCWaQYZL8=;
 b=CRWyL3cSd37cCR6fs0Nw/faZ/ppAVame/9ATxZZv2SL0SSKg0jtY+9jgNJzQ0tc6SYlX/q4hwv5D8ZlUxF0jjpBPQbcYGtBedw6tQDNTtuddme2UyAb1S/aNxlDmyI0PsKXQ8FzylEBQtgByCT+r7Ivg1AxiXzH8mKDNn8tg+e4zvVdfub/7HSith2IseSyejpQxNRTz9hCKgfnkWAhDAy8+jeHgcTaHHfw4RScvQu503pu0JDW515RGU9Dx5DOkYfQVqnozmA5dsfw3loXIbop1SJXs+QoGUgCj+xutUc8U9hG7cuvZSqMfdFVf7stC+NaSX7WjeAJPTJaXMCX91Q==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN1PPF0EE0B81A4.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::306) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 02:39:54 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 02:39:54 +0000
Message-ID:
 <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 2 Apr 2026 10:39:51 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0007.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::12) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <bc3170d2-c5d0-471a-9d02-e173f832e82c@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN1PPF0EE0B81A4:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d9be8a-25d0-437c-6758-08de90611f08
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799015|19110799012|23021999003|15080799012|22091999003|24121999003|25031999004|6090799003|5062599005|5072599009|40105399003|53005399003|26121999003|440099028|3412199025|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0Z4ak9IZWVNN1k2OXBJL0RIcW1TRGZCOEo0WDJnUXlpQWhVYVp4bDhJelVL?=
 =?utf-8?B?OXY0RXVTakhpMTRxV1dkTHN5TkN6Sk5pK0Z6YVdJVVZhZmk3bzNlTlVZU1Ar?=
 =?utf-8?B?TW5FamZCQVpKZ2ZyTkJWSHpOelJOU2FESEpxMzBYa2JoNVdhdzE2WWFBelZn?=
 =?utf-8?B?aHl6cEV0UDlEQWlJcDQxZmNlellaUStxWDdpUTUwRXdVWGdzcFF3SXozd01F?=
 =?utf-8?B?SFR1eGQyVHVSU1B3eGhtTnBsbkR3ZVF4dUs2MTJiWjRUUmVPSkFSQ1hPUWZE?=
 =?utf-8?B?L2xhWFhzbm55cVBYYTlrK2RXVWY0eE5IN3pIMC8xbmJuMmcvRnExSzYzOWcz?=
 =?utf-8?B?bzMvY0RxMFQwMHdBaXRVb0g3aERIOGFaRVBZNXNwOXZ1N05aQU5IOGpBNU1T?=
 =?utf-8?B?bFZncWo3OTk4UUE4cUtLSXBNMXhDekVpK0dJTHNHeU4wK3BsNHcxbTQvSXcx?=
 =?utf-8?B?bitSbFRaekdxR3loeFBOWGMwLzdHY0pySm0zQWMvSDdjUU8xK0JDem0wK21v?=
 =?utf-8?B?bjhITkVQUlU0OHVFS0E4dWFGTUFRZXVMSXdqSXRSajBlbkZvczVndzlnOEFT?=
 =?utf-8?B?SUZ4NFdlcEhsTWFvV0lTT1lpS2dGc3IzbkJTMXRmdjlJcUZXbXFMVEpabHUw?=
 =?utf-8?B?aG1Ta1FzSkhSdG5JUFc3NVlHVzhERzVJUlBqcGc2WjBHclNwSEJRSjRrZDRV?=
 =?utf-8?B?cHFoY253Zm56dzBJc0MrcitKNHNHRjd2Q0V1RG04bzlINThyQVM3L3psTnFC?=
 =?utf-8?B?YXd6UmVPa1I0TDdWdUx3VVlhR0h3dVUvV08xN1N5TmN4MXhJRVFkOW9sdWM1?=
 =?utf-8?B?d2VkR0pjZ3VnZmM5VkZyaHpWcWtoN09xNlEzRC9zN3JqWlB3TExqR3VBbmRV?=
 =?utf-8?B?YXUxT3U1YlhDS3RSbVNWR2FhaVVBZ2RpckF4aWZ3YTQycWpSR3pCV1FiL3lX?=
 =?utf-8?B?VkxNU0V1UmU5b0NwVDBoakhObm5GbGtEeG5CMmZ1alZFYmxUd1prUjRyaE9F?=
 =?utf-8?B?M09TVHNxUXJGczdUa09BTnowWFNRMVdqK1QvVUMxQk5RQnZ3NnJ5R3daQnhI?=
 =?utf-8?B?YndFSWh2SzRUeHZuR2hVMWJVL2J2Z0tJa3AyaTg4VVNHNWdmazhIWUFjeHho?=
 =?utf-8?B?OEpFakg4Sk1wT3FiU1orRC84OWNVSnROelkwdnpFZHY5V0hnbXE2eFdXeGM2?=
 =?utf-8?B?WlhmeE51NlpOZm05ZmMwbWxYODNGVjhrMWVGYmF0OG5lV2NOZUhESTFjYmR6?=
 =?utf-8?B?VmNHdXNQUXJzSENTN1BjQmF5aDdlUzM2WVA3RHNKa3RmcUQxemJoall4Sm0x?=
 =?utf-8?B?RUZLekpKT0tYeEQvRVIybU81NW9zK2VxeDJyd0xITzNpWnliTndQUHd3Vk4x?=
 =?utf-8?B?OUUyZ0toeVJrZEJFUHFxeEYvaU9Nall5Y3kwalo1RE9PUWRQZmlnbVZRMHY5?=
 =?utf-8?B?ZHA2a1BEMU5QUGUwT2lhTmNyYkI5cnJySngzeHFxZUlCZ2RqT01yRnd3RnNy?=
 =?utf-8?B?R2Rsbkhxb1AxMzBYZ0hXUC9nNkZiaVdzUFM5ZXlRdlcxd2oxUFpydldMUlhp?=
 =?utf-8?B?VEJOQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UStDVzArVXJLYU0weXI4RDNJYnZvRERadG9PZk14ZGZGSWRVOHZSejlIem1L?=
 =?utf-8?B?dEdUdUQrVjU5bGdURTJXWnM5ZWJTTFRhblJSWkFsTlBxNGJ6b0tVNVN5dmFh?=
 =?utf-8?B?RVRWWXpNZUgwSHhNbUZQV2Z4aHpFN0lieTZiV2ZERmtyQllmaVYzVTBDcjB0?=
 =?utf-8?B?b05GWU9uTzNmOXVUWnU3emtVRm9GMDhDY1ArZ1VsWmQ0ZFYzN1JxZDhKWXNo?=
 =?utf-8?B?dW5YU01URGNPdXk5QzBZd0phbEhKK3lYSlJBWWsyNFo1TkpNK2JhV2V1cFdj?=
 =?utf-8?B?c2tqT1RxZzdDbG1ISkpDWTlaWWptc0VWbXA3dVRHUmI1WUdtYUQxYkVYekpi?=
 =?utf-8?B?aTNGdFAxRnR0UWlxL1RmTCtSK2Q1Ni9WMkdvOExSd0dqYVZhRGl5Sms1dDFW?=
 =?utf-8?B?OXFSdS8vVUVQemg4MnRTc3NrY0xqRlBMc0Z2QWRqU3BoWTNSMjlaTWNoSGpk?=
 =?utf-8?B?OFUreWJvSGRmL3ZmeXJ4OWtTTHE2TldicmF0U2JrRlBZSWI5Sm13bVpXMUJP?=
 =?utf-8?B?V3M4OVpCVUdKem9VOURZSTkzQXFFdUJUMDk5V0lWT1NzU0c2MDg2WENKZzdw?=
 =?utf-8?B?ZTZVd3N0ZjRQV2U5dUd1OXBYVEtsUjJpUVJHYXNoVVJMdUtuK2JIbDZLS1hB?=
 =?utf-8?B?ZklTS3RwMUZyQjUvUWFPdENma1FLWitXckFXbmhxUGFsMUFCQ1A1Wi9NM2hv?=
 =?utf-8?B?alZDaTJsbTdQNElaT3l0QnVHNHR4eWg2QlJURkdxQVN2aHFVZ1JxNmlDY1gy?=
 =?utf-8?B?L1I3MitURlFvcDY0dDV0ejNVb1FlNFU1OVNTcnZlM0dWOWJUK2ZZSHp1OHFE?=
 =?utf-8?B?WUE5OWJXejlRSEJIUjhSUHRYWHVnelZORzUwTGt0dzNmVThBdTdidHZlSlVI?=
 =?utf-8?B?SkhEbDY0aUU0aWxDYk1oZjBiUW41dnpSSWJ5K1BqRWYyS25zaHJCcnp1ZURw?=
 =?utf-8?B?b2ZTOTgwL25zZ29KVS9Gd2tHRGhNeVN3VVRScCt5NVhHcHc1UGRXNkV6MFEw?=
 =?utf-8?B?cUUxS0FHbmV3ZHIzUVhISjlwM29Mck1ML0FFa1B3YnRWMHhNQS9oZ2hRTEpH?=
 =?utf-8?B?Z1RzbmNZaUpQc084VTRKcGF2a1VEcUVKV05OU3pLZytnUzdYcldpRmlYVkpN?=
 =?utf-8?B?M0xnbHFDSCtjd21QOW5lQVhsQ3ZDa205S3NKRVBNd2dHRWxNenoweDM2S2Mx?=
 =?utf-8?B?K0tGa3IwcnlCK3RIMTU1TFZTMXFsOGxiajRzRFRmdXhhMUFTN01icndsZnFk?=
 =?utf-8?B?Q2F5T3p4UUhqZ0JBZHlBZ1FPZFpBeDhIczR5OUNINzh2ai90VUx3SHNYL2Zr?=
 =?utf-8?B?aFVhbDBEeWZqWmxFckJoaTh2bW91d05oOU5DMFZjQ2xWM3JMUm9jdG52clhh?=
 =?utf-8?B?YXRUQ3c1OVg5ay9QSGhCOExDYk1LVTlCdGZESUdPQmdaUnVPd3pGUUxRektE?=
 =?utf-8?B?aU42Wmt6dzJRWnU4YStrNXpZakVFZFVLUWQycFZ4N2tnWmhmZGRQT1pEcS9z?=
 =?utf-8?B?RmYvN0JKY3hTY2QyUTJxTkhyRlJmMzh0OW5jbFVkOCtkczY5Z1Z0cGNUL1Nn?=
 =?utf-8?B?bFNmUXE0a1lmd2xMSnVxV2o2b2VwVm1ZWVlnTFFqYjdySGJYbkNvNGwvNk5x?=
 =?utf-8?B?d2RTOG11cHpxV05YeHJLREt3bGFaMHV3RUtuTEZTeThicXhxQmt5UzFJZW52?=
 =?utf-8?B?VE95OHluU29VMmlNcUJwZnlmZmVhNjhZaWlabGdYWlNkOWxwcWVoQVVSRE40?=
 =?utf-8?B?aThvaU5uLzhmN3BlajJJNGhlNGMvVlQxbFROTVRSblNoSkpjTEVBZXNwdHNa?=
 =?utf-8?B?QjNVY0RGeXpRNHdud2lrWkhSMlMwdzN6LzdpNWNMYUFtK1VjU2lBNTYrN1F6?=
 =?utf-8?B?amsvaG1iUnhURUxhUjJhQkVHTW1wWlRYbUc1MVJ6SW0zSXNtT2dDb2JjRDhO?=
 =?utf-8?Q?bzyfeL7mF6nDlSLroubFMKVH36yV+bag?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d9be8a-25d0-437c-6758-08de90611f08
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 02:39:54.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PPF0EE0B81A4

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

BTW: I'm still waiting for my key to be added into the pgpkeys.git and 
hoping this will not block my PR.

Thanks,

Chen

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.1

for you to fetch changes up to 7b159ed9c81cf7e0d0b75666e6548ceface2e1b5:

   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel 
number for DMA controller (2026-02-26 06:12:22 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v7.1

Sophgo:

For CV18xx serials:
Just a minor patch to replace the compatible for
dma-controller to allow setting DMA channel number.
New bindings and driver part change are picked by
DMA subsytem and this patch handles the left dts
part change.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Inochi Amaoto (1):
       riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
channel number for DMA controller

  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

