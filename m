Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D59942903F
	for <sophgo@lists.linux.dev>; Thu,  1 Oct 2026 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873833; cv=none; b=J0eVU7YG/TJVQlo2U1CIyjuakqPmoJIAlKlbtwGFb57mfPE08nCRSXgNI80xJMNcH1jCeYqRjAjSqPD5+QgBHV6kBhIvFoQtR+XYhSHao08+g1cFMo6+pEHcHv1aBq0qdyMK0Pk5fYYHJDRd4UAXzRtMpV04RhQHgr+bDmvmRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873833; c=relaxed/simple;
	bh=T0sTwhNjA7urD/dDmrUooY66jFkiBVRt4kMtyxZutVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXjGYMu2ZLEhfhswWsGW8xYQyxcegOneNt7OO8pFfpv2WCwD4qT83foMD4ZVNpHOQNZoe7tBiIXgs5D9r8qkryHU51jMduEyR6RnRlrPs6NdIHEEfC3gQfQwh8T52ha1MQ8DambYSRrx+P9ZcQ6S0kJhN9FmJQjHEJIUGM9cipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky71HCCC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky71HCCC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso6385815e9.0
        for <sophgo@lists.linux.dev>; Thu, 01 Oct 2026 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873830; x=1791478630; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=ky71HCCCuzdNRzjtjONLd/LO+cAML3OH7xliNje9t6etVNqbHM8drsETRJF9G4LzS9
         p/m6+pXj+WCXDIbkskmcrc+eLwXmjaYD4C6fcku7AwYXOQ8hAlO1P7+wWKr90frNWHMM
         /ZsuIRZPmGngMjx9wKW6pEURJSJEM97haUBBsdZZuqnIUywyAesWhv19gdMPmWQNxXbF
         1N9dHEMcJWaAg1XNXpBR76/1TIEGcfx8l/yCHJLvLvCV8QdtgZmKBHR0G1qclHVHxcoS
         BZYxW3utRsEY0I4tIzIX21wI1Jkt3Kmq0b9RZczg511De3hpciRWW6lUhW5R/hyfAUw8
         cSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873830; x=1791478630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=0PXxZAJ5NPmYHYN94xOWdSM80ApzrqZIHK/K0RIsjJmnsr3GWsPDfVoKycecpZ4o01
         GfTm5aQlyvySUcSlNtYm/j/gofZ8iREcnOJpGn2hju9Zgm6un50bphMvKD8RsLd6ikYn
         3thv98WzClx/MKBxiahyCigsvQvSYilHyqGFXmqp4nNpqTMZcyJxoyEnCRMvu8/jqNFi
         Ho1cwhybqR99nSJPkeblqXEnOBKuNynIWGEAFRpowY08AmeFEHs3qbUEZNhLe8WOsN/S
         EHYQzPm8nfXT1T2HdrpOfvvmTC00I0H3v339nyoSMMTCLAwP0wS4UYJbfUegqxwWSnGe
         gnwg==
X-Forwarded-Encrypted: i=1; AKwUvBzR8MxAc4+V+LH9FbtzvH3qJJQ4XvmAbVuZJ3wMzzA+eG2BfKD6i4M8DsCAADPjOTTKw2kaIaE=@lists.linux.dev
X-Gm-Message-State: AFuF++m2ibkSLYUa14XJxXEQ0nXY6FXKyvSn4u973oYBp4yNaTrfH2pH
	LCPbxAerNcv49EAFWt4ESpy811UwCooaPM7fUgrHjS4a0Exui/CLfaTF
X-Gm-Gg: AYBFou05E0G0QF79VTPxADJB5JUlwMBf8croLcoH1EO81DJHEllF/W/qKPX0q450kVw
	7tYXeDUTpW4lvknJkcCsg7sc8oi7JL2PRgzg9eT9Vah+DA+mN2UxPf1sL3i6bP44ATrGCFqHyDT
	E20jsMCnl7nx9qv7fYIPH8bGv5b/HtJLNuJUgRC9AY3hsz9Xe0S93JQsarRSiUfsLjDc01LM8zJ
	1/5HQsWUFt3pgqPjwfaJqCCYD5qvYjPcyWP0muLWhYNqlT2yma0DbZi9Rf+s6WWHskfuv14crIU
	ViDJv9AX0hcDfdsxGoSnWC2UMNdW3VTrh30gPXlXiL9XzDpXEfZnTiObVvy3hNYjqRCJDW3I0BM
	8wRo/Zls+0AAZHF8tUWK4rBvfwcDB3sGxwoyjtJhZMnrKGBk/5OQ/NMuOaLyShxZgOGBjn7QCIC
	335T1Sk32yqH4vZzMrW49p7nNKao+v5+Bhx9S2eU6SmGICjAXigYqeTvBmvTXBlbr7pJl2HVc=
X-Received: by 2002:a05:600c:6995:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a0275857a7mr3761895e9.30.1790873830150;
        Thu, 01 Oct 2026 09:57:10 -0700 (PDT)
Received: from [10.2.0.2] ([159.26.109.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027906a11sm2044415e9.12.2026.10.01.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:57:09 -0700 (PDT)
Message-ID: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
Date: Thu, 1 Oct 2026 18:57:08 +0200
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
To: Hiago De Franco <hfranco@baylibre.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com> <ar6E4bQAKonCW3st@hiagonb>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <ar6E4bQAKonCW3st@hiagonb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hiago,

On 01.10.26 18:08, Hiago De Franco wrote:
> Hi Andrei,
> 
> On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
>> Hi Hiago,
>>
>> Please take a look at the patch [1] and the discussion.
> 
> Thanks for letting me know, I missed this patch. Do you happen to know
> if any overlay was sent? I was not able to find one.

I haven't seen it, so I guess no.

> If none was sent, I am happy to send one. Sorry for all the noise here.
>>>> Thank you!
>>
>> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
>>
>> Best regards,
>> Andrei Lalaev
> 
> Best regards,


-- 
Best regards,
Andrei Lalaev
