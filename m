Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C96260573
	for <sophgo@lists.linux.dev>; Fri,  4 Jul 2025 06:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611200; cv=none; b=uDs92j8mHz5u3ljcRGPpBYePsAUtdqjHgo8cNG3oYhqB3E6qbnk2YRV5kBitWquEmc10n6rq4jLN3nEoWP2bpAAnVrQw1cnmAolEXTFQ+rSJpqZisHMZmXGsdx+2Fxo/gA20Rhim783t8EnYRVqFcHvw8KXPdKsVk6f2ADOcwBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611200; c=relaxed/simple;
	bh=pvuhNh618YoO0a35GFC8Pw7Z07LNofJkXZ0OpcrTbTY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=l3tjaN3fI292RH0zfpvnkjnnea5UbL5Gnmg1yoNNRWGoQpM3EctMpMHuSVWlEFNoZIDhoaacUABwSgD6geMpQHACVZYHPfE7PBHX9kCbMOJCOtQl2Av5SbYgCp/yANuOCc4VWZLkefO0qAxSrZWcyhvmxx3ZXmQxUX2jV0TfTT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwM/WBhL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwM/WBhL"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso566256a91.1
        for <sophgo@lists.linux.dev>; Thu, 03 Jul 2025 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751611197; x=1752215997; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymwt9R5fmPgIM//LR+Lj3Iy4Vwk081dGhvYmgoS7Ai4=;
        b=WwM/WBhLh36rvZDL7+9V5ckIkSpe7CN0n3Qg1qqAKY/RZwFdrmuzQHDFj+HI281t8e
         TXuHL5iO5RPIJV/Z2N9g4tLgySWe9mkb//ZX51X2oGN5ryxGtNtauzE8rVcnpESt+lq+
         7/Hk8Uy6dHuJreJ/6Y/A//Pg9sSLHFVUE4oot0dwoE1JRKWMTQT6uE8sJ6axGLLfI5YB
         BpXzu61J8RQ56E5BJPvTuQHKCbG2s496ktny/527y767VdaP5/YIcSh+qOAjCNDU0bQz
         rhCDGPzjxDloCp0uIaZ2Q0iUus01Jnj2evMQnLTiiJ3QwV+xTLZAKWGpC+qAX6jph/wc
         SDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611197; x=1752215997;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymwt9R5fmPgIM//LR+Lj3Iy4Vwk081dGhvYmgoS7Ai4=;
        b=QdKSacSyNI5vbAT2zf67m24/K8Taz7hJy1Jy1g9GYIGdwQxrOuCeThZXA/Obc9B3QH
         IMpvmHPWqBefqZ8nCTunXziIbyCe9I5nLvYGCKJE7YSkqO8zT0Q0bRReAO7bqCvXFJnR
         SXSIWqFYkRlXCAYA67cw0IC6O6Uuq6Zt9wlASfVuLa9/4+/0BdtymKJ/Jj6Cbc4mqaAx
         WDWCtvNQRxtW6Kia5dtKEwzA5Xef7vf4pSV5YSwKM+XkRJ0PeKr7sxuVc/pVhO3ENNTv
         0UDADSIS4SnmTAuIC6x6DKFngXNJwGLbhoZBpiMSdytJcm2J1YNh2o9tXtbApcRosc3y
         Q2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxmur1KEPm8ngFLOFR9rzU3/kCWTpAHuxCz5T3FnYI5jrcs1SJtAp+miDEBwVdiAtWIvaVb/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmvJRxANQTWYVgQzJmiCn7abB90XhT4HfxcT1jbLS44fry/+te
	1EeMkyDq/ZRW5wmh0A3LSdiT82lI9bPYwKtWvffSeRayDi63MuDvpj/d
X-Gm-Gg: ASbGncsvxjv4AZvDrtAE4iFHbA6j4mmwPHWjIh9vfnFOtyy1Z/fP3Vuc0HalfFqHnJT
	oCGh62Ul3LMFfFTqgkusd4LrkzISXUdWg2T/SzHFCCXkd8y+AIkqQpQJmjJL02seLRZsR2Zu/zb
	CdvWFeqX9TripMbEYqhKpZfckv6LrpahE6czkvXDL5oUQmqpiYHBlvBfq+zTPk4mf5ZqsIwntT4
	xw0DkBVscdfKgVA2Q3l4EUyKbPFrEvh6R/8QIIIX8h00ieupnMVeLYd7Uawu6c3SvQv4B6qlTnL
	HXMCDqZk7YTjmQEz2mhaPs6CXoZgk6zcXGq8v8bJkcR5fplJ8HNa747jcLcCpz9DJw+L/A==
X-Google-Smtp-Source: AGHT+IFOkhU+1nxlQZhAQxZXi77aM4zfexPWDU++C9eDMbXR9WmHMDnfeoJU+xJpMd5beE5eWd6dYg==
X-Received: by 2002:a17:90b:264a:b0:313:f6fa:5bb5 with SMTP id 98e67ed59e1d1-31aadd853b5mr1776898a91.18.1751611196972;
        Thu, 03 Jul 2025 23:39:56 -0700 (PDT)
Received: from smtpclient.apple ([206.83.106.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cd1be78sm4231889a91.42.2025.07.03.23.39.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:39:56 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add pmu configuration
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250703003844.84617-1-inochiama@gmail.com>
Date: Fri, 4 Jul 2025 14:39:39 +0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <58869404-7F27-4299-AB26-1B5E9F59D8ED@gmail.com>
References: <20250703003844.84617-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> On Jul 3, 2025, at 08:38, Inochi Amaoto <inochiama@gmail.com> wrote:
>=20
> Add PMU configuration for the cpu of sg2044, which is the V2
> version of C920.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 91 +++++++++++++++++++++
> 1 file changed, 91 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi =
b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> index 6a35ed8f253c..2d21b2881ab8 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -2778,6 +2778,97 @@ l3_cache: cache-controller-16 {
> 		};
> 	};
>=20
> +	pmu {
> +		compatible =3D "riscv,pmu";
> +		riscv,event-to-mhpmevent =3D
> +			<0x00003 0x00000000 0x00000010>,
> +			<0x00004 0x00000000 0x00000011>,
> +			<0x00005 0x00000000 0x00000007>,
> +			<0x00006 0x00000000 0x00000006>,
> +			<0x00008 0x00000000 0x00000027>,
> +			<0x00009 0x00000000 0x00000028>,
> +			<0x10000 0x00000000 0x0000000c>,
> +			<0x10001 0x00000000 0x0000000d>,
> +			<0x10002 0x00000000 0x0000000e>,
> +			<0x10003 0x00000000 0x0000000f>,
> +			<0x10008 0x00000000 0x00000001>,
> +			<0x10009 0x00000000 0x00000002>,
> +			<0x10010 0x00000000 0x00000010>,
> +			<0x10011 0x00000000 0x00000011>,
> +			<0x10012 0x00000000 0x00000012>,
> +			<0x10013 0x00000000 0x00000013>,
> +			<0x10019 0x00000000 0x00000004>,
> +			<0x10021 0x00000000 0x00000003>,
> +			<0x10030 0x00000000 0x0000001c>,
> +			<0x10031 0x00000000 0x0000001b>;
> +		riscv,event-to-mhpmcounters =3D
> +			<0x00003 0x00003 0xfffffff8>,
> +			<0x00004 0x00004 0xfffffff8>,
> +			<0x00005 0x00005 0xfffffff8>,
> +			<0x00006 0x00006 0xfffffff8>,
> +			<0x00007 0x00007 0xfffffff8>,
> +			<0x00008 0x00008 0xfffffff8>,
> +			<0x00009 0x00009 0xfffffff8>,
> +			<0x0000a 0x0000a 0xfffffff8>,
> +			<0x10000 0x10000 0xfffffff8>,
> +			<0x10001 0x10001 0xfffffff8>,
> +			<0x10002 0x10002 0xfffffff8>,
> +			<0x10003 0x10003 0xfffffff8>,
> +			<0x10008 0x10008 0xfffffff8>,
> +			<0x10009 0x10009 0xfffffff8>,
> +			<0x10010 0x10010 0xfffffff8>,
> +			<0x10011 0x10011 0xfffffff8>,
> +			<0x10012 0x10012 0xfffffff8>,
> +			<0x10013 0x10013 0xfffffff8>,
> +			<0x10019 0x10019 0xfffffff8>,
> +			<0x10021 0x10021 0xfffffff8>,
> +			<0x10030 0x10030 0xfffffff8>,
> +			<0x10031 0x10031 0xfffffff8>;
> +		riscv,raw-event-to-mhpmcounters =3D
> +			<0x00000000 0x00000001 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000002 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000003 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000004 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000005 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000006 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000007 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000008 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000009 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000a 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000b 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000c 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000d 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000e 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000f 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000010 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000011 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000012 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000013 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000014 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000015 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000016 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000017 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000018 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000019 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001a 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001b 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001c 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001d 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001e 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001f 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000020 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000021 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000022 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000023 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000024 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000025 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000026 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000027 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000028 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000029 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000002a 0xffffffff 0xffffffff =
0xfffffff8>;
> +	};
> +
> 	soc {
> 		intc: interrupt-controller@6d40000000 {
> 			compatible =3D "sophgo,sg2044-plic", =
"thead,c900-plic";
> --=20
> 2.50.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

