Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C18371D01
	for <sophgo@lists.linux.dev>; Mon,  8 Jun 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925300; cv=none; b=qz3KlqP01Nx5imGXctLvvX6ctS092BBUwJJfD4D+LeFucXG03W5C+bcdlsjOT1HYrVNEuf4xiimYrIcXwxKyu+DsCm8C3HhRwjxSCT2d8Os4DixdyKC0VzXFHQji1d/tYHL5YvrZWLP69jkk4r7LAvCIQb0QMre8e786yjlDaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925300; c=relaxed/simple;
	bh=uWdRfO0zWpCZ8PkZwhGYqIytHWCVD1izHNYuSvs4Y24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXLPukRMh5IMvagQRgqCBpf+Rg/hDG/sIMAy+J4GVIqwDgSFCI3LK5Af87yTTXQ+6TZs2T7sF0+TjKAEKmlECtLiLPK234z3O5KqMWLYhkaAv3dscXTDWr29o3JcGDuEF3Rz9QsOnOmA+h2izU6qz5o68r/qenC6V1EFp7ZBX+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rT+TcTHW; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rT+TcTHW"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so44676196d6.2
        for <sophgo@lists.linux.dev>; Mon, 08 Jun 2026 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925298; x=1781530098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ib003UxJC6YmbGgQtGcZFebArkcoz8imvCj7f2/9g8w=;
        b=rT+TcTHWDWw6ArquliLbz1UZj6NPvbCb6nXJsFe4eT6soiNr3hQJTk2/CyVRBzAL3Q
         bXTE5l9tbMoZcveKYy7owaPHRXCOUakQF+r/DnRytkMWBaiJSlKsnXjzb9mSlBF2zm5v
         VyXQ6rbzwX85LPrNG13uidSi8cHVl4PmqSvgpndI65gA0BoIc80OBqOU1TTYxyV+lqS9
         8Ufv/M9Y/GStxE+kxtEag67baPAM5GsRKU6fTfOCtpnNDmN7ZFvFw2C+Y/Z1UpjnHKZD
         0TzRscpLnvNEiY8LGTezfst08qwFO4oDmMOK5cxPwg30mI6tECkVNrXnYFx2ME/mH73p
         PHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925298; x=1781530098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib003UxJC6YmbGgQtGcZFebArkcoz8imvCj7f2/9g8w=;
        b=p46kRCu+ejpbgOh7FlkM54DttgzGs3ifxN8UVz3eNRXt1/9GT3Gg2aH0KkFe1LcfEh
         Q7ZZtzdcrQCK6TXN8Of7tWEFSY+m6yuXb3221pHghuJRUH1F8h7SGnnHSzV8EbfvP3N8
         zXfvgH0CMU/nV2tT7EUt78ePkvN+7BFExigIaO6dGNj1aDonb/20/ilEuruK2SXiS2Cr
         kNlxXUEAiNp7ub7M6GIBuWZKld8UG++oCSkRvU623o0+1uGNfS2ZGp9Sky/HsvXd7qU5
         Udf22LRCOG3fO/CmWVoJ36guuAFagRMopu79r6G+NOdV/D5Y8IuRSHvqAzeJxCGw7M4N
         grsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mTsi8la7E8HB7hMIDj34WufCFJmA5tV6c9NqZ6bgm3cl6WWcuLbb546b7cZr/GSL/G+tqvlE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz+NPcgHqKUeL7LgmTbBjMH45qzutwFCrCpB5lT2kVVvaUYhF8
	tOz3w6KO7uOTgBxRnxODW4UF5maEEqJnnLm/32PNhWaOyWK5Kllnp3OT
X-Gm-Gg: Acq92OHygQytRZzoFK5RiMeNEnjik1PSGJoGyV8wJglMBnslstRLqCm2V5mNT5kBgd7
	wKj78on/pxo7xbez3vkbpl1VH8HS0lHIIBUijv+ErF/UqzTojdhzUCb2cwgCBi71E+vagu6q0rO
	EClqAzzyUqn2FdRalaCjrvqJ7sUyEpce/lwsunHJtMU2BqzzHxmAoAJPLrZwgRE8kIfpE3RBwcf
	2rB2cuTyZZzPQcVFFlDeC+VAmuSV7Pbwj7XTuzugCL04W2br2JdWWW4pCWiK+YrqXCgeF7GgloG
	3fvUXxoUVLeQvT9RfHwYe7s5G22o1VowA9kkImKJTOIzutc9zXBCuUgBGq1QQUlEgt8qdG9fL2T
	nSkPpI19SzcJYUNzYeRl62LkAWqCgzqJiZ3GvNZfgWjwKZ2OY0KTjJtAbPC4lhq813maHqcIyZ/
	wJQZlABxJjjIYiL2e1H2Cbj+4RiucvRPcOaGDgkMDohDlIWqMygwEoiHZzzxjdbBVGK20=
X-Received: by 2002:a05:6214:451f:b0:8cc:f175:3ac4 with SMTP id 6a1803df08f44-8cee626eec5mr239264806d6.43.1780925298393;
        Mon, 08 Jun 2026 06:28:18 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm163934526d6.49.2026.06.08.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:28:18 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:28:10 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, daniel.lezcano@linaro.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
	anup@brainfault.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Message-ID: <aibDam5mwkaIJhHw@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <ahteTfYC5QMlpjF2@inochi.infowork>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahteTfYC5QMlpjF2@inochi.infowork>

Hi Inochi,

Thanks for the feedback. The next patch will have a large change with the
pinctrl, I believe I will have to drop the tags for that. For my reference
would the tags be applied to the commits or the top level patch?

I have the pinctrl configs staged in my tree but I am having some issues.

1. spi3 conflicts with sdhci1 (wifi) when enabled since they share pins,
   I am not sure how the original DT had it working. Im assuming they had it
   enabled and the user controlled it through the pinmux program? We originally
   tried to enable only what the vendor had in their DT. Taking another look
   at the vendor DT spi3 is the only SPI enabled, so we probably should not
   choose a different spi node. Should we just disable spi3?
2. I am having trouble getting the card to enumerate with just the DT. I was
   able to get it enumerated with some kernel changes and I am trying
   to translate those changes into the DT.
3. I added at least one pinctrl config for each device. For the devices that
   have multiple selections, should I add all the configs?

Have a great day,
- Joshua Milas
