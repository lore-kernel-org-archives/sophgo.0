Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD61F92E
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741993619; cv=none; b=p5SrHoZqXD4ETL6sbTbiTsG1lXmaf/90m0wz3xEhfJIcg8tSqHxK8a0odljcDS9RCVH5hATZwWXI8QmfGM/TTC5XNNiyIBW1ghKGMWUd2bLy0dX1J9seIQIb8njqTrYYLzdZhmeAQ83p3c1aaAZVyikTxhDtkLG+1dCY8YhX72M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741993619; c=relaxed/simple;
	bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLkO2Mp0Od/bTJffEtbd4wncSGD/SbjyxnOMYYus2dNxKFKbf49RLZQKqdS0wdbfrd+zihq8BjT8FrkEvh6MKlO+OBoPIIL8Ui02+pzo13G+dhBdqhstWe+g6lwvvH3kTEaSGN6vfxXjt6NMvxuBIkgrqrJVtXE5tWM5O/Dua8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pxGwii3b; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pxGwii3b"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549b12ad16eso2768974e87.0
        for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 16:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741993615; x=1742598415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
        b=pxGwii3bdCH14wYFgFXInRWggQs7qBCaaw+7uoyslJoIVxfGdKm+h/+EJju884xEjJ
         ltSLyBP6Cfmcin5s6x21PlWKaL8UOBrs9Y33GnVPq1nlcsEQDWv8pTZKvCs9K4xQICIU
         JE5Hs7qWs44lCSyyyz7lNihWYUHpx2GOqcZ2aSiqxZA5baBwCgzxPs4/E+cROhNIcW2B
         lCg2FJQ56zMI47KVamN0wtpgjbm1amNCSqJ/1dRxiIFc4Ybv0Z4Tj70bfu0Fi7r1XDqn
         F3lkCBcIjZK6BPjw5Y97OeV7llEDvtH5wZTYyIYS1Yt3kWw4gWcyl5BnrHrm+uxUPf5v
         LXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741993615; x=1742598415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
        b=LRGz0/WcCLW1Bfpscp8GJS96872eFi5Yaz2+HeGOtnZH8iCokRpABkFXj9dpmJiU40
         fW5FnMsTnW3eNGS7jNnxErQncqnNoDNsKd0ZWLlQm1FJ7wfXY+8SmmwUYv7wMKUhSz+G
         H3pHnGCQHP1816z9sc7mOWv3Ap83lhSLG5EZSMkWV/p/HbNfHOBW5kAhWb0dprKNeVA0
         ibulP9NW2OlAgrlTeoKbpP8LyuzeWeM7zLBAiVC0mstfx++f8mPu1pKm2CAZ6YShKPkC
         vBqAdmbn+PHz0HNM4j5gmZV0NZCajI7qGiMo7DDFAv/mGka7VnsvC0Q6u/A4DDdG0PQw
         n7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzinJXw2ie728hPVC/ydgaQ5/UVXYK8fjKsYagAbgWVibNC7mewQOkKRuO5LT/oefgsqxktSw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9pim3PTKZY9Bl15GQWgskq5+hb82gEd7BDHdua6PJEcUm0Qpn
	o8RCTM19P2qBtYhYwnU5K8BGTcmEmFt6hR+NlvK/zoLcc6QX4cdfclrCyTPWVmRyJQzRp8n0/gX
	XfxZDOiBu+Fjta0Xr/cUbzpKoRwgCHDgSEHs/OA==
X-Gm-Gg: ASbGnctvBCpLxxtX78q6h3klpEiJgYZKLulQsL73PYTQCCd0Db2Jg13Y4o1dPGhlDAe
	t/A28gO3du3QD9XKPAsTCrkCYKVYkcaYxi/Iyxo/fLRlQTryGU4G9/AQB9d46vl3xC9qUbyQB1Y
	tsXBS/nf1K/8zJyITofaQ5k+U=
X-Google-Smtp-Source: AGHT+IHuC1J1Yai2jxQeHMWFOi6OTmbD9XMUMWazPqqGxbglq+6gRZz39mX62xhHQPo6JQAFPJkP4DF+ZOLbOQK/cmQ=
X-Received: by 2002:a05:6512:b0e:b0:549:4f0e:8e28 with SMTP id
 2adb3069b0e04-549c39002d0mr1743882e87.15.1741993615226; Fri, 14 Mar 2025
 16:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
In-Reply-To: <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Mar 2025 00:06:44 +0100
X-Gm-Features: AQ5f1JreJjRROiVW-E27I_Wa53A3PnD8rRVkk2LLMQxZb6Qre-JjpCb6QRbcc7Q
Message-ID: <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 11:05=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:

> Are you actually doing incompatible changes here, or is this
> just about the DT binding?

If it's just the binding I guess we could do that stunt where we
apply the same patch independently to both trees and let git
sort it out.

Subject "dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC"

Sadly it's not the first patch in the series so you can't pull just that
from my tree.

Yours,
Linus Walleij
