Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0731984A
	for <sophgo@lists.linux.dev>; Fri, 15 Aug 2025 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755238636; cv=none; b=SQ7GCQN1YVDTUsCcshYfEs5yc1r9Rx/mMqe6M9ZnuObbDDg7+Tmkl/4VE4ojCCPluKl11tfdxzerJi3JBRndR3HenSiaDP/mv0THvwLqBj7wiXAZtNdHX2oQo6NKlxgygGrImPl7MW34xwx5RhjCUeW7bSkTkp5cCs5Pc/rQerY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755238636; c=relaxed/simple;
	bh=/KDEoxlZvjb0Z6uihzeAzpeqr0RhkGZsDZFZiSKbGcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5wbuw6hIO67W6RFIIsf4aQzoXn1hwT1zZKlzz1FV4GORaBCebs+oHPABzZRI2iPhB0SCF+5W9qJ4CiEZLXqd4wuLv2z0ITlOvdCD+YsKLOQVgfm0Y/6zZyP94WUJsV72fUg5hkeqLGXwUnrTtFWhSRVouJTVU9Zxc1Nl3PZo+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0KNE953; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0KNE953"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32326de9cb4so1531853a91.2
        for <sophgo@lists.linux.dev>; Thu, 14 Aug 2025 23:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755238634; x=1755843434; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGmhR3eE/KutZ5tTndwU0D7V2yrLWDVr0mRfiGse/PY=;
        b=D0KNE953PzVqUjl5moQyRh+JOiInjQO+X6xoKToTuTcs1mlLGBSsB5BgFwU7wpRmFk
         UALvIpli/PQbnXtSg50xe9V6LyuKs5dHxHBOSwhtPUW0e/LUq/PfHQZjPsqBhQsz3a4K
         6buMpD8GQZXxRuZ8mgepIdfHA6MtchMqbpqrS9gC+EtplKyywW6gTD1bUeOc7/yzGKUL
         mwImHQtEuCNWhHnjT2r/P93L3eZhmbkkV4+wcsOKOnFWBRYZKmZhaaLQxpINrc1mQfDQ
         EuAT7VcxEBYErdHmd+iBtjDKlHcSAgPkfpnPQfUKai5rGxxGdIgTbiCnQQ9dnTU0cqze
         VDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755238634; x=1755843434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGmhR3eE/KutZ5tTndwU0D7V2yrLWDVr0mRfiGse/PY=;
        b=XV8/wH8dBbNa7Jf/1JLNsSSWGTFq0ESSYfgsj8xgr6wbD5sdUJsxvsov8J28C/tWuO
         X6rCozkXmgutj0LqnCFL8awzhsxa/kT4/ppndLy4VGRKtZkM3aJ/Sg4FRs6Spk8WDIdO
         rLOyV0mvK/nx51mayDmdfNdKRwPTZ1sqy5N8GTukcRJDwPbMyu+ABFc9YgROBd7HmVSg
         mQ6hg09XyX46yBhjd8roEqem1JlhWjtWBCqnFApq1kQAoveaPnQOlnKzMoYEE5xQ00FU
         HofWOThxvMNTHdRjydJ7fFzW1W1LpnH+eKOKVqjM+e9ic78zLfppDkPdhEIiHe4qctRt
         J9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN9NroULXhU/h6V49bY1TL0zspDFoN5wI89GZItAb3fjngWNkq172d8O6cgJZW77ng2hX54VU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbxwP3OnssDIi20JUmyMIelfqJ2s9FSV6TRIapEQirzdYhsIJW
	wMKXMmeV6lyafEL26AabDkxCXZoGD39B+1jQ5j9XfjXmd3WjUWealo9d
X-Gm-Gg: ASbGncuFL4KQ7GCiYyss48BJaA+xDqK+RRjZugw/eDOkkR33xC3pTSgM/i1h4UTHWoR
	Y1sseS7qmVf2AtkgwQ8N8gijAtHz09CUkrwOW9+Lmlo83GB5qPM2cuyNbBTJcqtUFrgCXiz9idY
	Joiae+UTHs/DV3Kha5UmW7dNz1bXybeIUwWsCIReybuzfhY4PLbsu0uuHsv2Y6tCveEWgwMsPhQ
	LoSipIKecjItR+ni2KNWQlD2WUeuWugB965yaBogC2TLxsx5GnvFr2xesy3QjqsMt1iFezKltTA
	P1FTD85iJ0+r1yuxMg1Rku/x/TXAa+wNvE61o4MRHcJNStRHuuwdgDsVMaxbauuExi2NUF3RZEy
	o2VUXDOS1UwXGqgdCmfV2MQ==
X-Google-Smtp-Source: AGHT+IF70Lheb7c+uHnvLNkSjmCuMaFdEeN3otVkmRbjbDz4XiK8jFRLMEOf5LsZb4VaMWosSsczoA==
X-Received: by 2002:a17:90b:134f:b0:311:ed2:b758 with SMTP id 98e67ed59e1d1-32341ea22a7mr1402947a91.3.1755238634028;
        Thu, 14 Aug 2025 23:17:14 -0700 (PDT)
Received: from localhost ([2001:250:5800:1000::968a])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5a6df6sm433532a12.1.2025.08.14.23.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 23:17:13 -0700 (PDT)
Date: Fri, 15 Aug 2025 14:17:10 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
Message-ID: <aJ7Q5tQ3oa8DBpfO@calculate>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
 <20250813-sfg-spidts-v1-4-99b7e2be89d9@gmail.com>
 <MAUPR01MB11072CB6BD1EC94B752AA1F8BFE34A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MAUPR01MB11072CB6BD1EC94B752AA1F8BFE34A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>

On Fri, Aug 15, 2025 at 11:56:22AM +0800, Chen Wang wrote:
> 
> On 8/13/2025 4:33 PM, Zixian Zeng wrote:
> > Enable SPI NOR node for SG2042_EVB_V2 device tree
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > index 46980e41b886ce17dacce791fa5f2cef14cfa214..7001d8ffdc3e04c5a5cd5da85a4fb1c0351eb9a5 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > @@ -226,6 +226,18 @@ &sd {
> >   	status = "okay";
> >   };
> >   
> > +&spifmc1 {
> > +	status = "okay";
> > +
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0>;
> > +		spi-max-frequency = <100000000>;
> > +		spi-tx-bus-width = <4>;
> > +		spi-rx-bus-width = <4>;
> > +	};
> > +};
> > +
> 
> Only spifmc1 on EVB_V2? What about spifmc0?
> 
Yes, EVB_V2 has only one spifmc1.
I have checked schematics which can be opened by OrCAD:
https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x4-EVB/sch/SG2042_EVB_V2_20230302A_BOM.DSN
https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x8-EVB/SG2042_EVB_V11_20220902_BOM.DSN

For your convenience, I have exported them to PDF:
https://github.com/sycamoremoon/linux-riscv/tree/schematic
> Otherwise:
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks for your reviewing.

Best Regards,
Zixian
