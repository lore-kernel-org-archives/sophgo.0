Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BB322C6D
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768518310; cv=none; b=e7Dqv1RZlD/mLzSX+NUkbJpWXURKB+1GmrjRk1NW+arXL/FiUi1QpAgmA1g8/72g5ffCO69aOJ44C8txyQnSP1l6/lHT9FJI6f/2c0M6vsA86I9XTvzOg6cmcR9eEYGfPyS1DKNVg5X2evFAiCnAQR1B918uMKhPTPJxXWzOgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768518310; c=relaxed/simple;
	bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USjXPKC5Rujy/6EXGWlLpLMXJu1EBvsSqZoySnpU9u8TIIUaazdOvoITdePWSOkjG59O9usd1jTdJcCq7F7o1RC7AyxD5J11cMkHpd2g+JurrapTXxUPKhdR6xgBMls2QjBHUIHQCob/HgeXZr/IrHsqb1jai80MX81plvNB+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nMn/i4lb; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nMn/i4lb"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7927261a3acso15347297b3.0
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 15:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768518308; x=1769123108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
        b=nMn/i4lbWMYUPNj3ae5RV7efQX2CZ2OwcvvJ1+ghAhsc8K7J03o+jjfqZMJszlcdlW
         JfbUXYbjqXk0m1TaDD+biEP6Yv2YSyvtleYZAjCsV+GheuW82U3t3IIWtyPPPeI6yqmE
         VAizkfhBvvUv73ivv1ZpGhlQ1ETc3pzK0YtzJjyUpZdvWUUTq1XR3W+OBQ7FvAEpsg5V
         5ND+tln/RbrSBhkSg7lz8sUCPsz+G6r9vpm4rzu7jzamDW0vPQ8JSSCe/uKv1xfZqUZC
         UaaiKZkKXf2TQwMBApMIt4LBMK543OuNEWW3Qr6oCQK2o2wccmZ6DtUJH0DJeKgg717y
         zpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768518308; x=1769123108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
        b=deuw6C4iP1Rfb56tjZLEISa/tJGNS7XL2bxv7TA3+mxkjFdTsNgZntIBqO9M8in3hZ
         T5lGJTcY6+ET6lpvlrJMOUVYd8hhKeXBxJKFZKndhNAG7qHBZeXP6fPO+o4/5XWwwraj
         Onx9hUTtD5nO8/d/1iaKwiJcj6GrvXzgyMLDnjohNHE6vvodnI/zI6zbWi+TJjCfSef3
         EVlL5X8c+IqH71p/wdCvE3apRhb0W2myukvm/3439SYfmbyi9fNEvUAP5Mkb5/F665vY
         Sq6JiGrxkjjVtvta3u/B4FtHbkwmg44c92isNOqB4ydFeFyScmhUn7FKyzxrMfrOpzq2
         txGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCwOmA8dWey+9dX55eQeVkVi0BOe0muOHGNbMZ0uxVP8qkQI/KJyml+CSzwshEz3u2Gjfjmcw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXNboDrJCEqhnZw8PJ0Vha1gzeVZneiy31ynYYQvXHZJeffO6Y
	opNX00VuZqrjMnzZrj0iR8EpCQN9S6dRyp2oULrn1AGJ9h/6uNf9/1CyijwC1R//p3NAmwc/Pb3
	xpSa9Q9q4YhKbxojvoq9c4ioCqOz9dw8Lk150/0b6lA==
X-Gm-Gg: AY/fxX4i12OeHUyA8CcKsaP9OzOLp9IBp1vK0WFcj1wji2iNa6rn5FHwkbbJ6WoyNf4
	zUBsnT+hr5DcKjvBZL9YoWjLMBm3f9cl+vLByOGm7rzQOCngkaYfYOHfi60QcPzONv2pxxGfy0C
	HI5kexKwryRAwuQaihP+OqhbGs3UsglWAIQr5BFYe+0siVShfyMUg8FGU+niO650IPz0GsXEwAi
	RUrJPRHbkdwQ5jMpAR2j8q6B2KittdyoNO1er7xgElwah4LgpdTQCs6fEN5IOZdFPQZLGwu8lMO
	C1Y1ySzlWz919Cggzv+Gr3l9ufhPDiiBk6PxOg==
X-Received: by 2002:a05:690c:6089:b0:792:7113:a305 with SMTP id
 00721157ae682-793c671a7f3mr7321837b3.29.1768518308331; Thu, 15 Jan 2026
 15:05:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com> <20260115-phonics-reversal-80541ca1f2df@spud>
In-Reply-To: <20260115-phonics-reversal-80541ca1f2df@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 16 Jan 2026 07:04:57 +0800
X-Gm-Features: AZwV_QgpKX7QEi2C0Yhv9u5ga5ukQKR3VN0_gQKQrF7MKWPbynpMV7kUo4W9FqM
Message-ID: <CAH1PCMbc_QGZMicNNie9mvicaHHUbvLF-C+Xb-mgvPC59Sgnbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:13=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jan 15, 2026 at 07:18:56AM +0800, Guodong Xu wrote:
> > ---
> > base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
> > change-id: 20260113-adding-b-dtsi-148714533f07
> > prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscst=
ar.com>
> > prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
> > prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
> > prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
> > prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
> > prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
> > prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
> > prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
> > prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
> > prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
> > prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
> > prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40
>
> FWIW, this kind of prereq-patch-id stuff isn't really helpful, because I
> don't think there's actually any dependencies on that work. It actually
> trips up some parts of b4 that think they're needed.

Noted. Using individual patch message-ids is better in a case like this.

Above, I put the entire series' message-id, which creates unrelated
prerequisite stuff, as you pointed out.

>
> I applied the Anlogic patch.

Thanks Conor.

BR,
Guodong Xu

>
> Thanks,
> Conor.
