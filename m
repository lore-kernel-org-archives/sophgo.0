Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574078;
	b=CnROb1lylAiBdawABYfdHCC2S+tV2y5pm6373KE+PStBekCx3utRiVcGcsdhcRGXeQa8
	 GBRCGX/JemLsvn52N3rSAG5yG13Wto+YnM7bZ3/5zJpnNWEhogGQhcfKU7WXTYJJ8wd9O
	 5BI2yjEKdF1J7kulcx6tAFuOqzuSUK/wnzyN7bmyBM+CXCg9KCr6Jezvy4b4xKJ7nJ4z4
	 NPj/X+oa0QEf7491Bn/QmBdnfaq7096INEzS3rdXW39OkWBOtytXPuNjyq2BQYIzlDJvZ
	 RVqz9L58LrNSXRK/vPswtz6B0xfg9BEcJaFe7Xv1W0NBdcCURDp6wtOYrjRGooAaXNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+1V56suEOcrMa2DtNDFiSwLo3XA/LJsS2pjnPnOvVY=;
	b=RqBuNiqhCM2LUotF1LZo8f1BUrEkEjbhc8R6ySIytYXV/uNy8lVUd37cOcoEu85QbJXj
	 Dga9dJiUTRFdAeSVaQ3BSa94RiR5lBRuxTo86MRWzwO8qBhO4Q+gd5verdGSnzEFEMHGI
	 XBy5xb3wCWWCaRTOd3M86ZRIUkFfvan8P94u0rG3yK08YqAnJ6LaDqnMDS9cF0VGbDvK7
	 0eUZho4tim3dqUwJwtYAgsYuiNFeIlcG1fK5fvNOz3GOHSirHalZOtXmuCFXyKtx6FoDF
	 E/ySko+a9iv6NFldwRv62v2ryTJ7JfvZZNT8sqPHsc/7bg9psU68IomXP9PCS81IzTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYjFmFBN;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76C606A327
	for <sophgo@lists.linux.dev>; Fri, 13 Nov 2026 12:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A76C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYjFmFBN
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed58279115so1523695ad.1
        for <sophgo@lists.linux.dev>; Fri, 13 Nov 2026 04:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794574077; x=1795178877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+1V56suEOcrMa2DtNDFiSwLo3XA/LJsS2pjnPnOvVY=;
        b=kYjFmFBNkw2ZGgE8SosDt5UlLeAH43t0iKuvBKbiKYptgQk/X9KmwgB8hjAGF0Ep7n
         QtA5c+rmqHb64PgjfjMXgMgnWG3pwiVOiRowvZ2qdurWPJLjuxmfvSgu5PhXEtHKnTyh
         xJLl2I0ZySoKEf147mZhgAx0q8M2r3TW8Zs+j/TC34xHM+STjVcb2D0BzcnMjJdfu5nL
         hg5GlKaif27QavCYcyVB29J5yNOdhdhEP1jBSN4uTgcxJmT8Ronr1fOP4KUaZY/QU4u8
         T/v7qeaezUOdHGpGf3vXdWIkQlMBZKP+lKiAB8H55yATAqe5ZqB2gc7pk9kO3SlgNYSo
         HLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574077; x=1795178877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+1V56suEOcrMa2DtNDFiSwLo3XA/LJsS2pjnPnOvVY=;
        b=1hhCpVsUEDtBF3ITna8GgArsYZYQkfkuznIcs+2W1AoCyq0VgRYJw/rq8674XNkJGy
         3cKhumewbKJRNcLgENq0Kh+u8wSDmrcwgyCyOQSAnhAhFRpkti8cKIC6c6bv7BDk4M7r
         PS3VxJuxxorB0yYpEO3qabWzrBW4xK9AGYUBIa+uzyKzoyyUdPdSr92AjflkAs8AKMd9
         SPklnropB38Ig4OqtPIXEPh78BygiO0tTmCuTYo/cHbdBhLj9bxDJl6la+ugr0y2VYQe
         BTsiYl4BBTx6m44EE3eNEO6fujQ2wjBDDWcFgB2lJSXUN4YHlcIgWghs+I5Dc/sJl2bU
         NrCQ==
X-Forwarded-Encrypted: i=1; AL+hErEcSW0Tsh5s4X3lj73gIHzkegoH7AiCVfR/P5Lmia5NZ9VL09BhlkWwWN2YEzLhZuyWZDhbA3A=@lists.linux.dev
X-Gm-Message-State: APuU4Z+HaBeoZA9GCH27WdwTbmoZZGnyjXxzog0GBmSX41qxfcWZFW/w
	qrzQsD2K5HGYcV8SWshiKqd5IVFi9Bewqck/cTxHHMPOTPgO0B0qVrp2
X-Gm-Gg: AYBFou33V4sXtW15XTNuGBuabRtU0Iv+aRvgL/8gKPovLHKMuNDeQODclXyRCeha0Kx
	EXhSfwlNLCicNk9nKL73itRzzAwQPgiOC6jsYXCKKlu2AAEDUWISydSCTvT+gsjsWV+Qk7ALqwV
	lfcT6SQa6fpUHdz0QpVNIvPuu1auPtyvovOSnFHJ9QgwNCErKeYldQEkArPomGTQcloxhJvtr3B
	ah+D2GucwUsdgoS4anY8l5niF1N8Pj5Gs/ovjKP+/XkdFny3RS4WWQt3AvuQh8xDN155Jux1r3h
	ZmCSSb0fY4LKnAOVAg1FzIWR90ywI4G/WtS/inAtOoEApv41jLgvprs6ZAPd9pOEdFfz9tJtUya
	N4mP275l5i3MiU1LwQZaVESh7T1tLUoyWcdpi3hFkxrJ08TJD0CuksCXuSxgElvSh5VmRrdUjc+
	a0rtLm/O32l+jaWFJu5ShSefZfxL9USHtrGdLOGN7DdoIb5ctzRzvsO4e51b0iWFgrROrVDHpaJ
	nUNcgSYLwe9cwLAC/r24g8NQYaN+i5z6vQSPRGlZXhR7wBAxofBDzlQVmkHSwtSR41Mx1ywWH5j
	ZD31zvTuRSDfVZwcm2IWx8nTcvJfleQs0ZQBrTCAzptIrXrZ1GprwT7VWGMKvap1XCtEfYEDf+E
	0Rtk40CVuPB7t/5Vs4Mf50Wcz
X-Received: by 2002:a17:902:f712:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2ee0d366bbemr37294935ad.0.1794574077436;
        Fri, 13 Nov 2026 04:47:57 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm9382095ad.22.2026.11.13.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:47:56 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: AnnanLiu <annan.liu.xdu@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Date: Fri, 13 Nov 2026 20:47:47 +0800
Message-ID: <20261113124748.339778-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jan 25, 2024 at 05:46:40PM +0800, AnnanLiu wrote:
> Add the watchdog device tree node to cv1800 SoC.

Hi Annan, Inochi,

This patch was sent before the clock driver was merged, and I could not
find a newer version on the lists. Mainline and the sophgo for-next
branch still have no watchdog node for CV18XX/SG200X.

Annan, are you still working on this? If not, I would like to pick it
up, with credit to your patch.

Inochi, before I start, is this plan fine?

 - Put the node in cv180x.dtsi and leave it enabled, since it does not
   depend on the board.
 - Use the clock controller instead of the stub clock. In the TRM clock
   table, CLK_APB_WDT is the only clock for WDT0-2, fed by xtal without
   a divider. The counter clock is selected by reg_wdt_clk_sel in
   top_wdt_ctrl (top syscon, offset 0x1a8, xtal by default). Only the
   RTC domain watchdog has a separate clk_wdt, in rtcsys_clk_en.
   Should the node use <&clk CLK_APB_WDT> alone, or &osc as tclk and
   CLK_APB_WDT as pclk?
 - Keep the reset (RST_WDT) and the interrupt from this patch. The
   vendor DT has the same interrupt (58) but no interrupt-parent for
   it, and the TRM interrupt table names 58 "WatchDog1", so I will
   check it with the pretimeout test.
 - Test on a Milk-V Duo 256M (SG2002): timeout reset, pretimeout
   interrupt and restart.

Regards,
Chen-Yu
