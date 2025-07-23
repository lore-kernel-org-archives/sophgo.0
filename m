Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010014.outbound.protection.outlook.com [52.103.68.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7390272E42
	for <sophgo@lists.linux.dev>; Wed, 23 Jul 2025 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753255120; cv=fail; b=X8dWJvTiTEXblbe/E4k6xWqNPucyAa5sv9FIo5LewSO4Nnj4YhJyh6lHS6ouSb6FlqbwykFGD2tDRe3IiN+lw9gHCQfUGbemhRDjJETtEsDA4n7vxjyVKOsGKebVYZSmSCVWvd/cWJc3M0VPmaEJd1NzFQyDQG/XZrlazh1yIT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753255120; c=relaxed/simple;
	bh=9NyYzMaEFJ3phZFSZWSBOJFsZk24vlYTs1h3IqkR8lQ=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=TD3iTSL+4pO92cT6CEPI32m38wTcAwhSAVHhztGrQ6IB7WsxbzHSet6SqteuPqiz7kTvBI5ZoGuglIBg8nSK5sP7GEqXTLaWd91gMQ+1tvkES1ft2BslAMh/3a54o06+tRWVXRFPDZBMJyq1our0Ufb+IAB23/EvRJI40QZLEzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bRYIzVmy; arc=fail smtp.client-ip=52.103.68.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bRYIzVmy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAxyViXT6NW9DaGnzcM9L54mFWv4hr8nvvyvHLUA5khY2SnnUe5hrlLz53TBgzxVvO0dLJTv3H25MId5KeRs8qGadyOhVuvtz6N8bt1TYCvxEc63pBh35XpY1sj1S7D3ERzQPwhFJiQb1hAAgIU8GQ7i9AcOkP0lDHg5Da50hwa2BSI1E4qQxFFaCJb9t0NGmKCOPaWp8Ehdbqyjx5xiGaRP1KU7p3Kdir9Ni8qmTDbyC7TuiNSHUEIdsLOUXpsDhdVfSZwYlYAV0O873+2tCX+Qb5bHObBDmG9BRlfUWzqXSC9U314+GgbOrvlDkNXcoLGnn/9g2SNAX0cJ08Darg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTv7tDefwb/rAII53srZch53NWWTOcMAO+tH9oIHhQM=;
 b=hMaDr76Q6oqVP71GssrX87JAA00rfHDQoMxVM5neMdXjJOtAmB45psjTcEjAPSnoolIBEh4p2S4EYmVJiNGV2+zrHmp7wqY50X1EFiGbeoG9huHXQFn+CLlKtyF1aBIF0IVRTKY9XldbQkY3GNnLszW4+5yr5VsIX20c3nuyQCxbnSv2Z7v+fqv4gJtXmPM+MOCyImYGi/6zizXrNQfcCbY9kcXNZzBoxbR19kIi+CA53sQATsJTO7xgVyXxQZowaJEM5bHKlf1lW4uEOysVi2ZUfC1q0MHWOmAkAXOSBr95c/jY8QWZhxRkJS6woOlEFnZlIRkjhHpbjzKKhD8OQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTv7tDefwb/rAII53srZch53NWWTOcMAO+tH9oIHhQM=;
 b=bRYIzVmysIQQwGiUH8hXXDnYtbIjd3WkEHqcNl+cMmJUKojtiNaJn2AhqO8p3n8HoXY3zjopMGWpQwtQIWj9fibrGAsyX433ijQol7zqimKRIAMo8lQs2dl9GgBUvIhYk1OTW1AOOZIUpldp4PLhUTxsYU+s/HNI6vqFVmdNf21oF5OFkONT5LEvsZrvrE5OMerP2d/KdJtONakCoVm+G46+Eh8QQt02KfW5GUEooCAtU9+qiVQl8/qFmqB2Gg/HCce6xtd5Nz4odbU9GSBLCbpXAsGefEW9WlSJgRb5mlc0+StjR1Lvw477Z9x0DrkwyeT8CKSK+u12upx8XkphnQ==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAUPR01MB11024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:171::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 07:18:26 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 07:18:26 +0000
Message-ID:
 <MAUPR01MB11072C4B088AAC02268044E95FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 23 Jul 2025 15:18:21 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 Chen Wang <unicorn_wang@outlook.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] ARM Sophgo Devicetrees for v6.17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <c971bf61-b857-4da0-9dde-0d787703cf2f@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MAUPR01MB11024:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f319c7-4afb-42a4-accf-08ddc9b91d46
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|5062599005|5072599009|19110799012|15080799012|8060799015|440099028|40105399003|3412199025|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmU4U01CbUZDRE53OVFNaHVYSFZVVzAvRVZ0eGdJNUk4VWp0b2JBVXExdFVU?=
 =?utf-8?B?RjhQV2VBcS96SmU0amFLbGZ0bUVTcFlJR3lrWTJaeTNtSDZkZnkyUnYwL2xP?=
 =?utf-8?B?bnNzNmR1WVc3V2NUekwycjZUd3YyNzFWK0x4a2VuaGpOb1hZYnZvZjIzay9K?=
 =?utf-8?B?eFNZRjdPdFJscjEwekxMQ0g1Mm5VMDV4WjNyQU9qN1VHR0RDN2RneEV4Zlk2?=
 =?utf-8?B?QWZHRzd6TkZ4VWY0OHVPSHZ5Sm5WNlhWaW81dXZodm5hVVRWa3ZPdy91eVY0?=
 =?utf-8?B?d0RXMVBXM2Z6NGY4TnBOWHJDem1tYTBOYTNmWkZ0WVBKMlZ0WUtCOVBuc0Zn?=
 =?utf-8?B?bjNiYkRLdGVOWW1Camw1QzBrYkpYbEh3WHFKTkhKeGVhakI3UmdCUkVxbEZz?=
 =?utf-8?B?Z0o0d3lPQXNEUitNVHdER1hRZVNITi9oNWVSUGIrd3ZMOGZsQ1M0RnhyKzZv?=
 =?utf-8?B?R3Jpamtza21PTy8ramNKd3FmMFdZbjZCRUYwZGYwT1dXeXFGYnpKSmYyeWd0?=
 =?utf-8?B?d3dLQzFIK0doVTRFRU9ScnZkMWd1UUE2NFFiTWgzdkxjNEl2anltL1U2czEz?=
 =?utf-8?B?MUFhUmh4eU5lZEoxK1hGMHhoMGVWanZWc0ludmMzRGRsdG95NGUvaFBVOUlu?=
 =?utf-8?B?cDM5TndaSjE2MEZSR3drR25oTGplQ1FJZXZDcUlBUkt2am10aXlnM0ZDblZS?=
 =?utf-8?B?WUhDM1p0UTdacXRFVmdaQzI5am5PNUQrNFZEdWNVNEZkSzZmUlU1SEptQnp0?=
 =?utf-8?B?V2NjRVlnSlNSdTROZTRzUGdaL3dFb2YvRUlPVDIyQW5FbnZ0QU93NlBqd2xm?=
 =?utf-8?B?ZmN3bHJlZGlsU1FoaHl2emc1THdGSXE0dmk5NE84K3JoeWsvdEpuZGs2S0Qv?=
 =?utf-8?B?dFREN1YvUG9TN0tWR3JzVFcrb0hoQWpHeFd2VHlvQTJaQVRmbnRnRFBRVHlZ?=
 =?utf-8?B?bmhPd09DenR3eXJEeVpCTzR4bk9nNmdNRzdUaEk0Q3NjUWhLazlmbkcwNnpn?=
 =?utf-8?B?cW1uNll4YmYxSmpWNHJQdk01MFQ5aCtuci9EckFyVG5Rb0RnYnU4VURORDR5?=
 =?utf-8?B?ZGpLZVVYY0NZVnNwdnE0NVpBS3hjQVR5Tm9WSUZPcFNrcDFMU0NJZ25DVjho?=
 =?utf-8?B?UmdiclZaci9yaDZBRXdYMXRjOUZuc1NrTWJjaERCemdvREMwRXNtZzQ1UWsv?=
 =?utf-8?B?aHluTzlkM05JenNDc2JaTHJtQitOLzcvQStCME92RlZ6bFRaSU05YnQxRWlQ?=
 =?utf-8?B?K3ZTM3dqM0VxVjhMc1ZMM0NnSTIrMWI5amZKTmZKNzd2WTJkZmNZbXBHUDll?=
 =?utf-8?B?K1ZETEI5UkFZdUhlYXVwV2dVbmNZclZDQ1dobW1ON3grbDFoQWZuSVg0b0lV?=
 =?utf-8?B?akxnUG1WNENITHlRbkhZL0xDN1d2S25IS3hKbTRpNkxycXJYOTNuMjV1ZHRp?=
 =?utf-8?B?T0Z6U3VMWEN4U3hjY094VXQvdVdCcnRBMUg0ZW1IcElVSnBoc21pa0VhcENi?=
 =?utf-8?B?YndTaW5ocXlSbUJXYkZHdTdRYThBRGdTWnRiNGxUSUVSby9TcFM0NTd0V0tJ?=
 =?utf-8?B?QkpxTkR2Sm9janMvWHAyQlZ2UVVNZTVoMUxjV0RyMkxpcmk4KzJwZGMyOTZC?=
 =?utf-8?B?eVZ6L21KK3prSHlXOERid2YvVGFDR3c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEtURmE5RHNuYkk3QUIvMENyZjNUMXQzMXdpRDM2dVI0aTFvZHNpcm5mSkNa?=
 =?utf-8?B?c1ppRzBmNmplOForaHJwbHl6eW1Oai9oUWhURmpCQjZMdXZzN1Foam9PV3cz?=
 =?utf-8?B?S2xjQWczR0RleU93UlFOZ2Jnbnl5VjNoR3BXekE2aWt2ajZOdDBVd1lsU0hl?=
 =?utf-8?B?WG5PT2UxWko3Y3FFczh4b1FNVjFkNWtEVk41KzROcUtUbzlRTVdURDY2U3Jv?=
 =?utf-8?B?d0Zqdnl4c2lEUWEyeHRCRjJwaWVIWUZvOVlkbUdxc3VwWUVCQWF3M1lxcDIx?=
 =?utf-8?B?Z1h6OFJldHR3TUNPV0dyNTRlOFFERmdLUnoxZjlHeVM4OGZnWWlJa0ZyQVJR?=
 =?utf-8?B?SDJuWjkwWkFCcTlCQXB3REg2NFZ4czRrZ1lSelFRaVZ1enZkUy9lclgrckhj?=
 =?utf-8?B?ZStUdEV6T1MweG1LVy9KOVprNjRtMUZiYlZBazA0QUZFVkMwdkhmMDBjT2Fi?=
 =?utf-8?B?enBGMXVxMUVsRjY5T081VEZEMjBTVDJPMGJtcTc0VktSMHY1bldKK05ES1Rt?=
 =?utf-8?B?SVVLQjhWVm5yQnhyaWJMVkRjSEQ2WmtXamc1cmUxMWYzWVRxZFdZWmxEYVVq?=
 =?utf-8?B?eFJpYVhSWHdzbXJCbVprSEFvR1dFdCtwbnlzQ1VrTnVFNFpHb0hiUC9kN0wr?=
 =?utf-8?B?dHFlUWUvYjQvRXllVi9KR0V5dWNrWmp4WDhuRW1ic3M3Z2JaKzlXQm1Ca2pX?=
 =?utf-8?B?UmNuRVJHZXZDVGlSdDlZclZDcEN4TlNSQy9kZ3Z2UVJBKzFKd3IvZXJkMmFj?=
 =?utf-8?B?SW9jSVJ6SlpVWTc5SWo4dmdXRDJFV2c3VGJsMDRNSlJlbTNneUU1UHUyVitB?=
 =?utf-8?B?aXcxK01ZMGFOR2JqRGtPV00vak9TVkpYZzFEUkE0ay9zWkpPV0ZlYURxS0pO?=
 =?utf-8?B?bCsvS0dhM0lWdkh5RUV0NWdoSk5Wa2p4aWY2Y2k2M09TQXV3VEVTL0d1bWxz?=
 =?utf-8?B?UHRBQyt6ZXQwdWtGR3BxZTkwQ01GQnJZL1JOdE1JQ2ZoamZxNUpNbzZ5YTE0?=
 =?utf-8?B?N0pJWURpU1FTKzc2dzhLb01MYkNvMW9zM0swU1N2QTd2SVNHSkxzblM3dEN0?=
 =?utf-8?B?Z2FKQ1haOXpMQ3JueW5IbjNZYU40ZnRoWTNaNllTalpLNkx6TFErOUV4TG9r?=
 =?utf-8?B?bXJBcU1DcUdwbGtSS3l1WGt6N2dCMHgvVEwzRDZlVUFmeUdTRE80dEVLeXh3?=
 =?utf-8?B?ZnM1L0JWZENyUnVEU3FhVnRVZk0vemhYZ2RYaG9hOVBuQ2hzcnFwSGpmMndT?=
 =?utf-8?B?Qi9DVENmdEdyVkY5QXhnK2g1RlhPMDVKVGFOcStCYngwK3NoVGtucDZNczJS?=
 =?utf-8?B?cVE5STRHNnZlWFVkdklJTkIyVzVkdFpFKzcvOWNNRzRqM1h0eUZQSHlTL01n?=
 =?utf-8?B?TTZOUDdVNkZaSUFmaXFseEVCa280bXYzK2JZSkFSem1WclQxRi8ydy9FQUR5?=
 =?utf-8?B?K0ZHYzdMc0VVTXZRczFYaGc3WFRSTFBMSTl4Qmo5OEJaRkdCMlJOR2xNSEZG?=
 =?utf-8?B?ZndEYzY2MThUalVYODBNS0d2SEFHcVQwT2tMRVZoK0RVRXQ2ZWlJUE9wZjRk?=
 =?utf-8?B?bjMxVFFRZkZXL3JqYyt6UnlWYVVuTDcxS0xJa1dldURCQzdUeFVLVEM5NHpG?=
 =?utf-8?B?UDhBb2VvcC9wTFZtdUxaSUNmVnlNN041enhNUDFCcy85UXEvWVVOaGhsV3p3?=
 =?utf-8?B?S1lrTXJIVDUveWd5SFBBMW9tOVYzdUxmKzF6VC9qSFJyU05NckRHNjVsaFpK?=
 =?utf-8?Q?1IMJX0+6BLD7XTUhDO/rI/ZvhSYPW6D/Dn6qZmg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f319c7-4afb-42a4-accf-08ddc9b91d46
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 07:18:25.8325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUPR01MB11024

Hey Arnd,

Please pull this dt changes for ARM/Sophgo.

Thanks,

Chen

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/arm-sophgo-dt-for-v6.17

for you to fetch changes up to fe4fd701938197c2bceeeff670da3ace9b488d09:

   arm64: defconfig: Enable rudimentary Sophgo SG2000 support 
(2025-07-23 09:56:27 +0800)

----------------------------------------------------------------
ARM Devicetrees for v6.17

Sophgo:

Add support for Duo Module 01 Evaluation Board.
This board uses SG2000(old codename CV181xH),
which is dual-arch, RISC-V and ARM64. This
patch add the support for ARM64.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Alexander Sverdlin (5):
       arm64: dts: sophgo: Add initial SG2000 SoC device tree
       arm64: dts: sophgo: Add Duo Module 01
       arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
       arm64: Add SOPHGO SOC family Kconfig support
       arm64: defconfig: Enable rudimentary Sophgo SG2000 support

  arch/arm64/Kconfig.platforms                       |  6 ++
  arch/arm64/boot/dts/Makefile                       |  1 +
  arch/arm64/boot/dts/sophgo/Makefile                |  2 +
  .../dts/sophgo/sg2000-milkv-duo-module-01-evb.dts  | 76 
+++++++++++++++++++
  .../dts/sophgo/sg2000-milkv-duo-module-01.dtsi     | 40 ++++++++++
  arch/arm64/boot/dts/sophgo/sg2000.dtsi             | 86 
++++++++++++++++++++++
  arch/arm64/configs/defconfig                       |  4 +
  7 files changed, 215 insertions(+)
  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
  create mode 100644 
arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
  create mode 100644 
arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi


