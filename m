Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD41EDA03
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760163277; cv=none; b=D4hHGdsuS22v4oaHtbk1eA7XO/L7A4jNScCjToUeMN3UtJ6BC43mVclE8U+L43eEJYr2bCmv5lYKfKqLlm/60YO+lFRTWEvmpfBO2wAdz2gN+ffoTeuszhDHT3g11EZIntjhFbtTsRIQiIuQo4XvlwHUUA/OX93l+bpdXBQBgc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760163277; c=relaxed/simple;
	bh=UTjaf42LIjeTyo3K/jv+vC5L/FS5z6g6VwMZQWcCu2s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YN/d84eKj12ypJmJA5g05CjOGC8TXncySSEtnsmHRAYQ3YLz+G95S2Gwsvl+Nc+ecFPBV0dI84hMJNAjY7d4CZUqmrW9xM9UiC1CjSxlFHI3SItqg5IsmvcsFCBshghet+ooTL69AZQEE5oShmOrWJnWxUIdoSPOIXA8kx9PPAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7pMfoJY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7pMfoJY"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b41870fef44so502180266b.3
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 23:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760163274; x=1760768074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UTjaf42LIjeTyo3K/jv+vC5L/FS5z6g6VwMZQWcCu2s=;
        b=M7pMfoJYn2R3wPHZnhKeq501td4OysuzMd5CxpkzBZZD/xCoTe0V0mFEC8O6hsbWTA
         P1unA61qAC18zZF64kH4X9FuLwFhtzSkKCyhvvK7P6UEw+X1crF4Qdf/h4yGRC+UYtBk
         E4nd2Wovt+G8xej/cTBeZM1i5wyAVPcq2aD9MAV2jkXv4Zl256d0oyCQQxCPUwJnkdxX
         kpNQktx0huqqkqEx5VFGTGsP82EVfjG5woS6cwX/B1yjED4cm7PABKZaWbp9lqwlyErC
         X3ve/Xg12agkr6NzGL1gQ1U2Wn0uLTpK+nDg0QW0Uv/EnGm6mSmUPNJUfD9hls0YA4TF
         DvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760163274; x=1760768074;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTjaf42LIjeTyo3K/jv+vC5L/FS5z6g6VwMZQWcCu2s=;
        b=XKOuw0YeNCchFzJbInFMEiorYt/Tnc3yHPHLWOFB/2x6rbKKEiVOgha54thzxwU6QH
         41fVv/887LJkGt5XhUZlOxML6BSyYOoqWk/9VW2ipwDBpOMwpbbZsFqJ5POVLR/MxLET
         qlDqdvQBAOWO06hyxuvQpUNDxbiuWMtXW5ltNY89r6nphTWOwKaEGr5xjOUsXlx5X/L0
         4UWLMDBzfsATadp1wYmgJ30LmI0vHkUC8Gdvu1E4Rpe0E8BW5qu6rC2aGU/63UI8G7rN
         uEcysWWBgvkX3IeeOv6eObQLNjan+BzgOxFpjNaJsR1eAnsm3hThhRUwer36Gafa815R
         GTcw==
X-Forwarded-Encrypted: i=1; AJvYcCVWY7AUI7CNA2A6pULQ4rvBG41KOLSVAGmqDKGkRWnJDt5B3Zr6Z7ythMOa7yT8XNxiRlElfZQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBpz90SrVmrdGWfz/NPl+t6kZ3+fyDCw4H/mcmoIufy7ohm6se
	FBq4lbi6Im2fmcGbL8DYvNHivolgCnjaZIpx9vr+Ldgz2oLoLhZpeugx
X-Gm-Gg: ASbGncv9fwTJGZez35f0uEU+Sqrk9U0NEp+ULgAFJK/ZxuIFZVDta9JyuouKD6RuaBu
	fmdGAktPl8nr0H01YghhuiuQis3N/EyUj4o0XsF/UkzNazUH8HepaGr1ixxQQyOkmeQISY7snxY
	AieQzOto8OZH7MUiIojKwsQgPtEXfVuvreRPmM/Nk1lRgum4FZew/WPr/G0qGcXIQRVGO+hiAj1
	qYFihJw0cU40nl7QiQtn4SMAVnjL7s4ugwuBsK/ZOM3pUVHupafGLO9rpwhRBy5R7GCO1a1maTl
	RFJOV50mro1/dLpA8dNDEK9nCo4qDRWCcEbJfv1g6l2iU8GqlzUZssbJLXfNTO9cN6gkdNgrge/
	NFn/obAuYE9LLj2C18ZerFFbZcExW27Z3WR3CzdNg0QpmPJ3pWF/AIuoLWPkoYfXrTtn61kDH
X-Google-Smtp-Source: AGHT+IG9SiURtmUDXsCj0m5qBSvP5bZNzNwwIMu2kUT/BVhDH/YQM5FZneBmwBkIJ7WDhNDUvCu1Qw==
X-Received: by 2002:a17:907:9621:b0:b4f:3169:3ec3 with SMTP id a640c23a62f3a-b50aa9a25a7mr1564821966b.21.1760163274281;
        Fri, 10 Oct 2025 23:14:34 -0700 (PDT)
Received: from ehlo.thunderbird.net ([91.187.204.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951d210sm414765366b.74.2025.10.10.23.14.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Oct 2025 23:14:33 -0700 (PDT)
Date: Sat, 11 Oct 2025 08:14:30 +0200
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>
CC: Inochi Amaoto <inochiama@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_arm64=3A_dts=3A_sophgo=3A_a?=
 =?US-ASCII?Q?dd_initial_Milk-V_Duo_S_board_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <aOcVeFTUx_Qn85cs@sleek>
References: <20250927173619.89768-1-josh.milas@gmail.com> <20250927173619.89768-3-josh.milas@gmail.com> <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui> <ad86009bff38ddae0b291d3edbf958ce6363ece2.camel@gmail.com> <aOcVeFTUx_Qn85cs@sleek>
Message-ID: <55E9C068-3ADA-443D-BC51-1D50B09219A1@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 9 October 2025 03:52:56 CEST, Joshua Milas <josh=2Emilas@gmail=2Ecom> wr=
ote:
>Hi Alex,
>
>> I believe, gpio is long time discouraged here=2E
>
>Does this mean just the '&gpio*' entries, or other GPIO
>items like i2c and spi?
>
>Thanks,
>- Joshua Milas

Hi!
I referred to "&gpio*" entries only being deprecated=2E
